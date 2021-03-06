require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上、かつ英単語と数字が含まれていれば登録できる' do
        @user.password = '000000a'
        @user.password_confirmation = '000000a'
        expect(@user).to be_valid
      end
      it 'last_nameが全角なら登録できる' do
        @user.last_name = 'あああ'
        expect(@user).to be_valid
      end
      it 'first_nameが全角なら登録できる' do
        @user.first_name = 'あああ'
        expect(@user).to be_valid
      end
      it 'last_name_kanaが全角カタカナなら登録できる' do
        @user.last_name_kana = 'アアア'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角カタカナなら登録できる' do
        @user.first_name_kana = 'アアア'
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name 全角で入力して下さい')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name 全角で入力して下さい')
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana 全角カタカナで入力して下さい')
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana 全角カタカナで入力して下さい')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'emailが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは「@」が無いと登録できない' do
        @user.email = 'aaaaaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが５文字以下だと登録できない' do
        @user.password = '0000a'
        @user.password_confirmation = '0000a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)',
                                                      'Password ６文字以上で英字と数字の両方を含めて設定して下さい')
      end
      it 'passwordが英字だけだと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password ６文字以上で英字と数字の両方を含めて設定して下さい')
      end
      it 'passwordが数字だけだと登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password ６文字以上で英字と数字の両方を含めて設定して下さい')
      end
      it 'passwordが全角だと登録できない' do
        @user.password = 'ＡＡＡＡＡＡ１'
        @user.password_confirmation = 'ＡＡＡＡＡＡ１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password ６文字以上で英字と数字の両方を含めて設定して下さい')
      end
      it 'last_nameが半角だと登録できない' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角で入力して下さい')
      end
      it 'first_nameが半角だと登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角で入力して下さい')
      end
      it 'last_name_kanaが半角だと登録できない' do
        @user.last_name_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角カタカナで入力して下さい')
      end
      it 'last_name_kanaが全角ひらがなだと登録できない' do
        @user.last_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角カタカナで入力して下さい')
      end
      it 'last_name_kanaが全角漢字だと登録できない' do
        @user.last_name_kana = '松竹梅'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角カタカナで入力して下さい')
      end
      it 'first_name_kanaが半角だと登録できない' do
        @user.first_name_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カタカナで入力して下さい')
      end
      it 'first_name_kanaが全角ひらがなだと登録できない' do
        @user.first_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カタカナで入力して下さい')
      end
      it 'first_name_kanaが全角漢字だと登録できない' do
        @user.first_name_kana = '松竹梅'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カタカナで入力して下さい')
      end
    end
  end
end
