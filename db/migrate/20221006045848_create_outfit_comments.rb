class CreateOutfitComments < ActiveRecord::Migration[6.1]
  def change
    create_table :outfit_comments do |t|
      t.integer   :user_id
      t.integer   :outfit_id
      t.text      :comment
      t.timestamps
    end
  end
end
