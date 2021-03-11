class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, presence: true,
                       format: {
                         with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i,
                         message: '６文字以上で英字と数字の両方を含めて設定して下さい'
                       }
  validates :last_name, presence: true,
                        format: {
                          with: /\A[一-龥ぁ-ん]/,
                          message: '全角で入力して下さい'
                        }
  validates :first_name, presence: true,
                         format: {
                           with: /\A[一-龥ぁ-ん]/,
                           message: '全角で入力して下さい'
                         }
  validates :last_name_kana, presence: true,
                             format: {
                               with: /\A[ァ-ヶー－]+\z/,
                               message: '全角カタカナで入力して下さい'
                             }
  validates :first_name_kana, presence: true,
                              format: {
                                with: /\A[ァ-ヶー－]+\z/,
                                message: '全角カタカナで入力して下さい'
                              }
  validates :birthday, presence: true
end
