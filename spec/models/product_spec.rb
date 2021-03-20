require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品管理機能' do
    context '商品登録できる時' do
      it '全ての項目が存在すれば登録できる' do
      end
      it 'priceが半角数字であれば登録できる' do
      end
      it 'priceが300〜9,999,999の範囲内の数字であれば登録できる' do
      end
      it 'Product categoryのIDが１でなければ登録できる' do
      end
      it 'Product statusのIDが１でなければ登録できる' do
      end
      it 'Shipping chargesのIDが１でなければ登録できる' do
      end
      it 'Delivery areaのIDが１でなければ登録できる' do
      end
      it 'Days to shipのIDが１でなければ登録できる' do
      end
    end

    context '新規登録ができない時' do
      it 'Product nameが空では登録できない' do
      end
      it 'Product explanation が空では登録できない' do
      end
      it 'image が添付されていなければ登録できない' do
      end
      it 'Product category のID１だと登録できない' do
      end
      it 'Product status　のID１だと登録できない' do
      end
      it 'Shipping charges　のID１だと登録できない' do
      end
      it 'Delivery area　のIDが１だと登録できない　' do
      end
      it 'Days to ship　のIDが１だと登録できない' do
      end
      it 'Price が空だと登録できない' do
      end
      it 'Price が全角数字だと登録できない' do
      end
      it 'Price が300未満だと登録できない' do
      end
      it 'Price が10,000,000以上だと登録できない' do
      end
    end
  end
end


