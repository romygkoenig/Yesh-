class CreatePerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :performances do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :category
      t.string :city

      t.timestamps
    end
  end
end
