class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :region, :string
    add_column :users, :sub_region, :string
  end
end
