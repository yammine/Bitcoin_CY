class AddGbpToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :gbp, :float
  end
end
