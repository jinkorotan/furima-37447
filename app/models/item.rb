class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :condition_id
  belongs_to :shipping_charge_id
  belongs_to :prefecture_id
  belongs_to :days_to_ship_id

  has_one_attached :image

  validates :name,                    presence: true
  validates :description,             presence: true
  validates :image,                   presence: true
 

#ジャンルの選択が「---」の時は保存できないようにする
validates :category_id, numericality: { other_than: 1 , message: "can't be blank" } 
validates :condition_id, numericality: { other_than: 1 , message: "can't be blank" } 
validates :shipping_charge_id, numericality: { other_than: 1 , message: "can't be blank" } 
validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" } 
validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank" } 

 with_options  presence: true, format: {with: /\A[a-z0-9]+\z/i,} do
    validates :price, numericality{only_integer:true, greater_than_or_equal_to:300,less_than_or_equal_to: 9_999_999 },
               presence: {message: "can't be blank"}
end
