class RemoveTitleFromOutfits < ActiveRecord::Migration[6.1]
  def change
    remove_column :outfits, :title, :string
  end
end
