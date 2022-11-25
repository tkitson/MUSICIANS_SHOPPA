import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mapping"
export default class extends Controller {
    static values = {
      apiKey: String,
      marker: Array
    }

    connect() {
      mapboxgl.accessToken = this.apiKeyValue
      console.log(this.markerValue)

      this.map = new mapboxgl.Map({
        container: this.element,
        style: "mapbox://styles/mapbox/streets-v10"
      })
      this.#addMarkerToMap()
      this.#fitMapToMarker()
    }

    #addMarkerToMap() {
      const marker = this.markerValue[0]
      console.log(marker)
      new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(this.map)
    }

    #fitMapToMarker() {
      const bounds = new mapboxgl.LngLatBounds()
      const marker = this.markerValue[0]
      bounds.extend([ marker.lng, marker.lat ])
      this.map.fitBounds(bounds, { padding: 70, maxZoom: 50, duration: 0 })
    }
  }
