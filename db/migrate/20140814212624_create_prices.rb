class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.float :CAD
      t.float :CNY
      t.datetime :time

      t.timestamps
    end
  end
end
