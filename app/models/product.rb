class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_category
  belongs_to :prodict_status
  belongs_to :shipping_charges
  belongs_to :delivery_area
  belongs_to :days_to_ship
  
  validate :image_presence
  with_options presence: true do
  validates :product_name
  validates :product_explanation
  validates :Product_category_id, numericality: { other_than: 1 }
  validates :prodict_status_id, numericality: { other_than: 1 }
  validates :shipping_charges_id, numericality: { other_than: 1 }
  validates :delivery_area_id, numericality: { other_than: 1 }
  validates :days_to_ship_id, numericality: { other_than: 1 }
  validates :price,
             format: { with: /\A[0-9]+\z/ },
             numericality: { :greater_than_or_equal_to => 300 ,:less_than_or_equal_to => 9999999}
  end

  def image_presence
    if !image.attached?
      errors.add(:image, 'ファイルを添付してください')
    end
  end

end
