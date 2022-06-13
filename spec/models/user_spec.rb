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
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end 

      it 'emailは@を含まないと登録できない' do
        @user.email = "testmail"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end



      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字未満では登録できない' do
        @user.password="00000"
        @user.password_confirmation="00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password="aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password="000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password="ABCDEF"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password="123abc"
        @user.password_confirmation="111abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end


      

      it '姓(全角)が空では登録できない' do
        @user.kanji_last_name = ''
        @user.valid?
       expect(@user.errors.full_messages).to include("Kanji last name can't be blank")
      end

      it '姓((全角)に半角文字が含まれていると登録できない' do
        @user.kanji_last_name = 'ﾔﾏﾀﾞ'
        @user.valid?
       expect(@user.errors.full_messages).to include("Kanji last name is invalid. Input full-width characters.")
      end


      it '名(全角)が空では登録できない' do
        @user.kanji_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji first name can't be blank")
      end

      it '名((全角)に半角文字が含まれていると登録できない' do
        @user.kanji_first_name = 'ｶｽﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji first name is invalid. Input full-width characters.")
      end






      it '姓（カナ）が空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end

      it '名（カナ）が空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end

      

      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
   
    end
  end

