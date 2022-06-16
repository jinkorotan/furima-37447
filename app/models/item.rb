class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :condition_id
  belongs_to :shipping_charge_id
  belongs_to :prefecture_id
  belongs_to :days_to_ship_id

  has_one_attached :image

  validates :name,                    presence: true
  validates :price,                   presence: true
  validates :description,             presence: true
  validates :image,                   presence: true
 

#ジャンルの選択が「---」の時は保存できないようにする
validates :category_id, numericality: { other_than: 1 , message: "can't be blank" } 
validates :condition_id, numericality: { other_than: 1 , message: "can't be blank" } 
validates :shipping_charge_id, numericality: { other_than: 1 , message: "can't be blank" } 
validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" } 
validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank" } 
end
