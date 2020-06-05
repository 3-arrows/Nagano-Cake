class RenameGenresIdColumnToProducts < ActiveRecord::Migration[5.2]
  def change
  	rename_column :products, :genres_id, :genre_id
  end
end
