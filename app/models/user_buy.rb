class UserBuy
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_postal_code, :delivery_area_id, :shipping_municipality, :shipping_address, :shipping_building_name, :phone_number
end