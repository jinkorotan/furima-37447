class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)(?=.*?[\W_])[!-~]{8,}+\z/
validates :password, format: { with: VALID_PASSWORD_REGEX }
 
  validates :nickname,            presence: true
  validates :kanji_first_name,    presence: true
  validates :kanji_last_name,    presence: true
  validates :kana_first_name,     presence: true
  validates :kana_last_name,      presence: true
  validates :birthday,            presence: true
end
