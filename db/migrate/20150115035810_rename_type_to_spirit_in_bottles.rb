class RenameTypeToSpiritInBottles < ActiveRecord::Migration
  def change
    rename_column :bottles, :type, :spirit
  end
end
