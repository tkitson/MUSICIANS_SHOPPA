class AddSpotifyLinkToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :spotify_link, :string
  end
end
