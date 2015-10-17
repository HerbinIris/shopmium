class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :chain
      t.string :name
      t.integer :latitude
      t.integer :longitude
      t.string :address
      t.string :city
      t.integer :zip
      t.integer :department
      t.string :phone
      t.string :hour
      t.integer :store_id
      t.boolean :is_address_computed
      t.boolean :is_location_computed
      t.string :key
      t.boolean :ignored
      t.string :ignore_reason
      t.string :overload_chain_name
      t.boolean :mandatory_coords
      t.string :country_code

      t.timestamps null: false
    end
  end
end
