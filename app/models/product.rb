class Product < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image
  has_one :buy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_category
  belongs_to :product_status
  belongs_to :shipping_charges
  belongs_to :delivery_area
  belongs_to :days_to_ship

  with_options numericality: { other_than: 1, message: '選択して下さい' } do
    validates :product_category_id
    validates :product_status_id
    validates :shipping_charges_id
    validates :delivery_area_id
    validates :days_to_ship_id
  end
  validate :image_presence

  with_options presence: { message: '文字を入力して下さい' } do
    validates :product_name
    validates :product_explanation
    validates :price,
              format: { with: /\A[0-9]+\z/, message: '半角数字で入力して下さい' },
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: '半角数字かつ300〜9,999,999の範囲で入力して下さい' }
  end

  def image_presence
    errors.add(:image, 'ファイルを添付してください') unless image.attached?
  end
end
