class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 
  validates :nickname,        presence: true
  validates :email,     presence: true
  validates :encrypted_password,  presence: true
  validates :position,    presence: true



end
