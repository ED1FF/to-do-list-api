class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :address
      t.integer :zip
      t.references :user

      t.timestamps
    end
  end
end
