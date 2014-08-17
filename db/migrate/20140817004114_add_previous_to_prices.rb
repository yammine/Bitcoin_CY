class AddPreviousToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :prevCAD, :float
    add_column :prices, :prevCNY, :float
  end
end
