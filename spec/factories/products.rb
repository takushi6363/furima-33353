FactoryBot.define do
  factory :product do
    product_name              { 'テスト' }
    product_explanation       { 'テスト' }
    product_category_id       { 2 }
    product_status_id         { 2 }
    shipping_charges_id       { 2 }
    delivery_area_id          { 2 }
    days_to_ship_id           { 2 }
    price                     { 1000 }
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
