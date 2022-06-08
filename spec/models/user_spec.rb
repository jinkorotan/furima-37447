require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do  
      user =FactoryBot.build(:user)  # Userのインスタンス生成
      user.nickname = ''  # nicknameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.email = ''  # emailの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end    
    it 'お名前(全角)の名前が空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.kanji_first_name = ''  # kanji_first_name の値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Kanji first name can't be blank")
    end

    it 'お名前(全角)の苗字が空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.kanji_last_name = ''  # kanji_last_nameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Kanji last name can't be blank")
    end

    it 'お名前カナ(全角)の名前が空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.kana_first_name = ''  # kanji_first_name の値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Kana first name can't be blank")
    end

    it 'お名前カナ(全角)の苗字が空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.kana_last_name = ''  # kana_last_nameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Kana last name can't be blank")
    end

    it '生年月日が空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.birthday = ''  # birthdayの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
