class ChangeSpotifyToServices < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :spotify_link
    add_column :services, :spotify_link, :text
  end
end
