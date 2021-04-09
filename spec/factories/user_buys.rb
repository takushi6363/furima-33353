FactoryBot.define do
  factory :user_buy do
    shipping_postal_code  { '111-1111' }
    delivery_area_id      { 2 }
    shipping_municipality { 'テスト市' }
    shipping_address      { 'テスト1−1-1' }
    shipping_building_name { 'テスト' }
    phone_number           { '09011111111' }
    token                  { 'tok_abcdefghijk00000000000000000' }
  end
end
