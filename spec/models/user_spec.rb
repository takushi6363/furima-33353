require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it '全ての項目が存在すれば登録できる' do
      end
      it 'passwordとpassword_confirmationが6文字以上、かつ英単語と数字が含まれていれば登録できる' do
      end
      it 'last_nameが全角なら登録できる' do
      end
      it 'first_nameが全角なら登録できる' do
      end
      it 'last_name_kanaが全角カタカナなら登録できる' do
      end
      it 'first_name_kanaが全角カタカナなら登録できる' do
      end
    end

    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
      end
      it 'mailsが空では登録できない' do
      end
      it 'passwordが空では登録できない' do
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      end
      it 'last_nameが空では登録できない' do
      end
      it 'first_nameが空では登録できない' do
      end
      it 'last_name_kanaが空では登録できない' do
      end
      it 'first_name_kanaが空では登録できない' do
      end
      it 'birthdayが空では登録できない' do
      end
      it 'passwordが５文字以下だと登録できない' do
      end
      it 'passwordが英字だけだと登録できない' do
      end
      it 'passwordが数字だけだと登録できない' do
      end
      it 'last_nameが半角だと登録できない' do
      end
      it 'first_nameが半角だと登録できない' do
      end
      it 'last_name_kanaが半角だと登録できない' do
      end
      it 'last_name_kanaが全角ひらがなたど登録できない' do
      end
      it 'last_name_kanaが全角漢字だと登録できない' do
      end
      it 'first_name_kanaが半角だと登録できない' do
      end
      it 'first_name_kanaが全角漢字だと登録できない' do
      end
      it 'first_name_kanaが全角ひらがなだと登録できない' do
      end

    end
  end
end