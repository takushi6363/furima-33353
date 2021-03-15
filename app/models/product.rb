class Product < ApplicationRecord
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_category
              
  validates :product_name, :product_explanation, presence: true

  validates :Product_category_id, numericality: { other_than: 1 }
end
