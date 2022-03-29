class AddUserIdToPools < ActiveRecord::Migration[7.0]
  def change
    add_column :pools, :user_id, :integer
    add_index :pools, :user_id
  end
end
