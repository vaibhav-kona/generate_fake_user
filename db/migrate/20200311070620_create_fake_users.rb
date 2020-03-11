class CreateFakeUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :fake_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :region
      t.string :sub_region

      t.timestamps
    end
  end
end
