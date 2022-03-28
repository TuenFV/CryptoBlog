class CreatePools < ActiveRecord::Migration[7.0]
  def change
    create_table :pools do |t|
      t.string :project
      t.string :round
      t.string :platform
      t.decimal :amount
      t.decimal :price
      t.text :vesting
      t.date :launchdate
      t.decimal :profit

      t.timestamps
    end
  end
end
