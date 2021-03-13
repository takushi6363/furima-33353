class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products

  with_options presence: true do
    validates :nickname
    validates :password, format: {
      with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i,
      message: '６文字以上で英字と数字の両方を含めて設定して下さい'
    }
    validates :last_name, format: {
      with: /\A[ぁ-んァ-ン一-龥々]/,
      message: '全角で入力して下さい'
    }
    validates :first_name, format: {
      with: /\A[ぁ-んァ-ン一-龥々]/,
      message: '全角で入力して下さい'
    }
    validates :last_name_kana, format: {
      with: /\A[ァ-ヶー－]+\z/,
      message: '全角カタカナで入力して下さい'
    }
    validates :first_name_kana, format: {
      with: /\A[ァ-ヶー－]+\z/,
      message: '全角カタカナで入力して下さい'
    }
    validates :birthday
  end
end
