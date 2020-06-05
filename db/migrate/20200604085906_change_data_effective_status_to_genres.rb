class ChangeDataEffectiveStatusToGenres < ActiveRecord::Migration[5.2]
  def change
  	change_column :genres, :effective_status, :boolean
  end
end
