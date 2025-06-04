class CreateGifts < ActiveRecord::Migration[8.0]
  def change
    create_table :gifts do |t|
      t.string :name
      t.float :price
      t.string :url
      t.boolean :received

      t.timestamps
    end
  end
end
