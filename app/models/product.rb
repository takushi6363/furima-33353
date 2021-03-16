class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_category
  belongs_to :prodict_status
  belongs_to :shipping_charges
  belongs_to :delivery_area
  belongs_to :days_to_ship
              
  validates :product_name, :product_explanation, presence: true

  validates :Product_category_id, numericality: { other_than: 1 }
  validates :prodict_status_id, numericality: { other_than: 1 }
  validates :shipping_charges_id, numericality: { other_than: 1 }
  validates :delivery_area_id, numericality: { other_than: 1 }
  validates :days_to_ship_id, numericality: { other_than: 1 }
end
