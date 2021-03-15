class Product < ApplicationRecord
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_category
  belongs_to :prodict_status
  belongs_to :shipping_charges
  belongs_to :delivery_area
  bekongs_to :days_to_ship
              
  validates :product_name, :product_explanation, presence: true

  validates :Product_category_id, numericality: { other_than: 1 }
end
