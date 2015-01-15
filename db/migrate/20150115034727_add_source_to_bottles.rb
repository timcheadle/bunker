class AddSourceToBottles < ActiveRecord::Migration
  def change
    add_column :bottles, :source, :string
  end
end
