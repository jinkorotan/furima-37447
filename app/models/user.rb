class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
 PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
 validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
         

 
  validates :nickname,            presence: true
  validates :birthday,            presence: true
 


  with_options presence: true do
  #ひらがな、カタカナ、漢字のみ許可する
    validates :kanji_first_name,format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    validates :kanji_last_name,format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
   #カタカナのみ許可する
    validates :kana_first_name, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :kana_last_name, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
  end
end
