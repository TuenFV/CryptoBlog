class CreateVestings < ActiveRecord::Migration[7.0]
  def change
    create_table :vestings do |t|
      t.date :date
      t.decimal :rate
      t.decimal :soldtoken
      t.decimal :return
      t.integer :pool_id

      t.timestamps
    end
  end
end
