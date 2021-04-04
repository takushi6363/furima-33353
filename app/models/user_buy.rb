class UserBuy
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_postal_code, :delivery_area_id, :shipping_municipality, :shipping_address, :shipping_building_name, :phone_number

  with_options presence: { message: '必ず記入して下さい' } do
   validates :shipping_postal_code,format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "ハイフン(-)を記載して入力して下さい" } 
   validates :delivery_area_id,    numericality: { other_than: 0, message: "選択して下さい" }
   validates :shipping_municipality
   validates :shipping_address
   validates :phone_number,         format: { with: /\A\d{11}\z/, message: "11桁以内で入力してください" }
  end
  validate :shipping_building_name

  def save
    Address.create(postal_code: postal_code, shipping_postal_code: shipping_postal_code, delivery_area_id: delivery_area_id, shipping_municipality: shipping_municipality,
                   shipping_address: shipping_address,shipping_building_name: shipping_building_name,phone_number:phone_number, user_id: user.id)
    Buy.create(product_id: product.id, user_id: user.id)
  end
end