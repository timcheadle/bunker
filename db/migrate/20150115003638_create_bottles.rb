class CreateBottles < ActiveRecord::Migration
  def change
    create_table :bottles do |t|
      t.string :name
      t.string :type
      t.integer :volume
      t.decimal :proof
      t.integer :released
      t.integer :price
      t.date :acquired_on
      t.string :box
      t.text :notes
      t.integer :score
      t.boolean :tradable
      t.boolean :sellable
      t.boolean :stocked
      t.boolean :open
      t.boolean :finished

      t.timestamps
    end
  end
end
