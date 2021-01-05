class AddImageUrlToGames < ActiveRecord::Migration
  def change
    add_column :games, :image_url, :string, default: "#"
  end
end
