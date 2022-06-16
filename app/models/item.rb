class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id,condition_id,shipping_charge_id,
  has_one_attached :image

  validates :name,                    presence: true
  validates :price,                   presence: true
  validates :description,             presence: true
  validates :category_id,             presence: true
  validates :condition_id,            presence: true
  validates :shipping_charge_id,      presence: true
  validates :prefecture_id,           presence: true
  validates :days_to_ship_id,         presence: true
  validates :image                    presence: true
 
#空の投稿を保存できないようにする
validates :title, :text, presence: true



#ジャンルの選択が「---」の時は保存できないようにする
validates :category_id, numericality: { other_than: 1 , message: "can't be blank" } 
validates :condition_id, numericality: { other_than: 1 , message: "can't be blank" } 
validates :shipping_charge_id, numericality: { other_than: 1 , message: "can't be blank" } 

end
