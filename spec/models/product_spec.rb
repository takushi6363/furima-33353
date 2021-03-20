require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品管理機能' do
    context '商品登録できる時' do
      it '全ての項目が存在すれば登録できる' do
        expect(@product).to be_valid
      end
      it 'priceが半角数字であれば登録できる' do
        @product.price = '1000'
        expect(@product).to be_valid
      end
      it 'priceが300〜9,999,999の範囲内の数字であれば登録できる' do
        @product.price = '10000'
        expect(@product).to be_valid
      end
      it 'Product categoryのIDが１でなければ登録できる' do
        @product.product_category_id = 3
        expect(@product).to be_valid
      end
      it 'Product statusのIDが１でなければ登録できる' do
        @product.product_status_id = 3
        expect(@product).to be_valid
      end
      it 'Shipping chargesのIDが１でなければ登録できる' do
        @product.shipping_charges_id = 3
        expect(@product).to be_valid
      end
      it 'Delivery areaのIDが１でなければ登録できる' do
        @product.delivery_area_id = 3
        expect(@product).to be_valid
      end
      it 'Days to shipのIDが１でなければ登録できる' do
        @product.days_to_ship_id = 3
        expect(@product).to be_valid
      end
    end

    context '新規登録ができない時' do
      it 'Product nameが空では登録できない' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Product name 文字を入力して下さい')
      end
      it 'Product explanation が空では登録できない' do
        @product.product_explanation = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Product explanation 文字を入力して下さい')
      end
      it 'image が添付されていなければ登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('Image ファイルを添付してください')
      end
      it 'Product category のID１だと登録できない' do
        @product.product_category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Product category 選択して下さい')
      end
      it 'Product status　のID１だと登録できない' do
        @product.product_status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Product status 選択して下さい')
      end
      it 'Shipping charges　のID１だと登録できない' do
        @product.shipping_charges_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Shipping charges 選択して下さい')
      end
      it 'Delivery area　のIDが１だと登録できない' do
        @product.delivery_area_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Delivery area 選択して下さい')
      end
      it 'Days to ship　のIDが１だと登録できない' do
        @product.days_to_ship_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Days to ship 選択して下さい')
      end
      it 'Price が空だと登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Price 文字を入力して下さい', 'Price 半角数字で入力して下さい',
                                                         'Price 半角数字かつ300〜9,999,999の範囲で入力して下さい')
      end
      it 'Price が全角数字だと登録できない' do
        @product.price = '５００'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price 半角数字かつ300〜9,999,999の範囲で入力して下さい')
      end
      it 'Price が300未満だと登録できない' do
        @product.price = 100
        @product.valid?
        expect(@product.errors.full_messages).to include('Price 半角数字かつ300〜9,999,999の範囲で入力して下さい')
      end
      it 'Price が10,000,000以上だと登録できない' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price 半角数字かつ300〜9,999,999の範囲で入力して下さい')
      end
      it '半角英数混合では登録できないこと'do
        @product.price = 'aaa100'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price 半角数字かつ300〜9,999,999の範囲で入力して下さい')
      end
      it '半角英語だけでは登録できないこと'do
        @product.price = 'aaaaaa'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price 半角数字かつ300〜9,999,999の範囲で入力して下さい')
      end
    end
  end
end
