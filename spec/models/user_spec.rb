require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  

  describe 'ユーザー新規登録' do

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

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user=FactoryBot.build(:user)
        another_user.email = @user.email 
        another_user.email.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end 

      it 'emailに@が含まれていない場合登録できない' do 
        @user.email = 'hogehuga.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end


      it 'passwordが5文字以下では登録できない' do
        @user.password = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end


      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end


      it 'お名前(全角)の名前が空では登録できない' do
        @user.kanji_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji first name can't be blank")
      end

      it 'お名前(全角)の苗字が空では登録できない' do
        @user.kanji_last_name = ''
        @user.valid?
       expect(@user.errors.full_messages).to include("Kanji last name can't be blank")
      end

      it 'お名前カナ(全角)の名前が空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end

      it 'お名前カナ(全角)の苗字が空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end

      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
   
    end
  end

