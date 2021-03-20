class Product < ApplicationRecord
  belongs_to :user,optional: true
  has_one_attached :image
  
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_category
  belongs_to :product_status
  belongs_to :shipping_charges
  belongs_to :delivery_area
  belongs_to :days_to_ship

  validates :product_category_id, numericality: { other_than: 1 ,message: '選択して下さい'}
  validates :product_status_id, numericality: { other_than: 1 ,message: '選択して下さい'}
  validates :shipping_charges_id, numericality: { other_than: 1 ,message: '選択して下さい'}
  validates :delivery_area_id, numericality: { other_than: 1 ,message: '選択して下さい'}
  validates :days_to_ship_id, numericality: { other_than: 1 ,message: '選択して下さい'}
  validate :image_presence

  with_options presence: { message:"文字を入力して下さい"} do
  validates :product_name
  validates :product_explanation
  validates :price,
             format: { with: /\A[0-9]+\z/ ,message: '半角数字で入力して下さい'},
             numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999,message: '300〜9,999,999の範囲で入力して下さい'}

  end

    def image_presence
      if image.attached?
        if !image.content_type.in?(%('image/jpeg image/png'))
          errors.add(:image, 'にはjpegまたはpngファイルを添付してください')
        end
      else
        errors.add(:image, 'ファイルを添付してください')
      end
    end


end
