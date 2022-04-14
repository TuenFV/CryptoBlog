class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|

      t.integer :rank
      t.string  :name
      t.string  :symbol
      t.decimal   :price
      t.decimal   :marketcap
      t.decimal   :supply
      t.decimal   :volume24h
      t.decimal   :changepercent24h

      t.timestamps
    end
  end
end
