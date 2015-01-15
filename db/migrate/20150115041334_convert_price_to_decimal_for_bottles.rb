class ConvertPriceToDecimalForBottles < ActiveRecord::Migration
  def up
    change_column :bottles, :price, :decimal
  end

  def down
    change_column :bottles, :price, :integer
  end
end
