class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.float :CAD
      t.float :USD
      t.datetime :time

      t.timestamps
    end
  end
end
