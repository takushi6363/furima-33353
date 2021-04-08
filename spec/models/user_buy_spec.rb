require 'rails_helper'

RSpec.describe UserBuy, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @user_buy = FactoryBot.build(:user_buy, user_id:user.id, item_id: product.id)
    sleep 0.1
  end
  describe '商品購入機能' do

    context '商品が購入できる時' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user_buy).to be_valid
      end
      it 'shipping_building_nameが空欄でも登録できる' do
        @user_buy.shipping_building_name = ""
        expect(@user_buy).to be_valid
      end
      it 'phone_numberが11桁以内であれば登録できる' do
        @user_buy.phone_number = "111"
        expect(@user_buy).to be_valid
      end
      it 'delivery_area_idが1以外であれば登録できる' do
        @user_buy.delivery_area_id = 5
        expect(@user_buy).to be_valid
      end
    end

   context '商品が購入できない時' do
      it 'shipping_postal_codeが空だと登録できない' do
        @user_buy.shipping_postal_code = ""
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Shipping postal code 必ず記入して下さい", "Shipping postal code ハイフン(-)を記載して入力して下さい")
      end
      it 'shipping_municipalityが空だと登録できない' do
        @user_buy.shipping_municipality = ""
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Shipping municipality 必ず記入して下さい")
      end
      it 'shipping_addressが空だと登録できない' do
        @user_buy.shipping_address = ""
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Shipping address 必ず記入して下さい")
      end
      it 'phone_numberが空だと登録できない' do
        @user_buy.phone_number = ""
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Phone number 必ず記入して下さい")
      end
      it 'user_idが空だと登録できない' do
        @user_buy.user_id = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("User 必ず記入して下さい")
      end
      it 'item_idが空だと登録できない' do
        @user_buy.item_id = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Item 必ず記入して下さい")
      end
      it 'tokenが空だと登録できない' do
        @user_buy.token = ""
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Token 必ず記入して下さい")
      end
      it 'shipping_postal_codeにハイフンが無いと登録できない' do
         @user_buy.shipping_postal_code = "1234567"
         @user_buy.valid?
         expect(@user_buy.errors.full_messages).to include("Shipping postal code ハイフン(-)を記載して入力して下さい")
      end
      it 'phone_numberが12桁以上だと登録できない' do
         @user_buy.phone_number = '123456789123'
         @user_buy.valid?
         expect(@user_buy.errors.full_messages).to include("Phone number 11桁以内で入力してください")
      end
      it 'delivery_area_idが１だと登録できない' do
        @user_buy.delivery_area_id =  1
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Delivery area 選択して下さい")
      end
    end
  end
end