class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :address
      t.integer :zip
      t.integer :user_id

      t.timestamps
    end
    add_index :addresses, :user_id
  end
end
