// import { Controller } from "@hotwired/stimulus"
// import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// // Connects to data-controller="mapbox"
// export default class extends Controller {
//   static values = {
//     apiKey: String,
//     markers: Array
//   }

//   connect() {
//     console.log("hello")
//     mapboxgl.accessToken = this.apiKeyValue

//     this.map = new mapboxgl.Map({
//       container: this.element,
//       style: "mapbox://styles/pdunleav/cjofefl7u3j3e2sp0ylex3cyb"
//     })
//     this.#addMarkerToMap()
//     this.#fitMapToMarker()
//     this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
//                                         mapboxgl: mapboxgl }))
//   }

//   #addMarkerToMap() {
//     const marker = this.markerValue
//     console.log(this.markerValue[0])
//     // this.markerValue.forEach((marker) => {
//     //     const popup = new mapboxgl.Popup().setHTML(marker.info_window)

//     //     const customMarker = document.createElement("div")
//     //     customMarker.className = "marker"
//     //     customMarker.style.backgroundImage = `url('${marker.image_url}')`
//     //     customMarker.style.backgroundSize = "contain"
//     //     customMarker.style.width = "25px"
//     //     customMarker.style.height = "25px"

//     //     new mapboxgl.Marker(customMarker)
//     //       .setLngLat([ marker.lng, marker.lat ])
//     //       .setPopup(popup)
//     //       .addTo(this.map)
//     //   })
//   }

//   #fitMapToMarkers() {
//     const bounds = new mapboxgl.LngLatBounds()
//     this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
//     this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
//   }
// }