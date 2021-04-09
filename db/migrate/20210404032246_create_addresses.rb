class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :shipping_postal_code,     null: false
      t.integer :delivery_area_id,         null: false
      t.string  :shipping_municipality,    null: false
      t.string  :shipping_address,         null: false
      t.string  :shipping_building_name
      t.string  :phone_number,             null: false
      t.references :buy,                  null: false, foreign_key: true
      t.timestamps
    end
  end
end
