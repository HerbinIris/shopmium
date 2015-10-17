json.array!(@shops) do |shop|
  json.extract! shop, :id, :chain, :name, :latitude, :longitude, :address, :city, :zip, :department, :phone, :hour, :store_id, :is_address_computed, :is_location_computed, :key, :ignored, :ignore_reason, :overload_chain_name, :mandatory_coords, :country_code
  json.url shop_url(shop, format: :json)
end
