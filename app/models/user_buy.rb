class UserBuy
  include ActiveModel::Model
  attr_accessor :shipping_postal_code, :delivery_area_id, :shipping_municipality, :shipping_address, :shipping_building_name,
                :phone_number, :user_id, :item_id, :price, :token

  with_options presence: { message: '必ず記入して下さい' } do
    validates :shipping_postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'ハイフン(-)を記載して入力して下さい' }
    validates :shipping_municipality
    validates :shipping_address
    validates :phone_number, length: { maximum: 11, message: '11桁以内で入力してください' },
                             numericality: { only_integer: true, message: '数字で入力して下さい' }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :delivery_area_id, numericality: { other_than: 1, message: '選択して下さい' }

  def save
    buy = Buy.create(product_id: item_id, user_id: user_id)
    Address.create(shipping_postal_code: shipping_postal_code, delivery_area_id: delivery_area_id, shipping_municipality: shipping_municipality,
                   shipping_address: shipping_address, shipping_building_name: shipping_building_name, phone_number: phone_number, buy_id: buy.id)
  end
end
