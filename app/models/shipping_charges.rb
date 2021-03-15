class ShippingCharges < ActiveHash::Base
  self.data =[
    { id: 1, charges: '---'},
    { id: 2, charges: '着払い（購入者負担）'},
    { id: 3, charges: '送料込み（出品者負担）'},
  ]

   include ActiveHash::Associations
   has_many :products
end