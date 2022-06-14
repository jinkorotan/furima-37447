class Item < ApplicationRecord

  validates :name,                    presence: true
  validates :price,                   presence: true
  validates :description,             presence: true
  validates :category_id,             presence: true
  validates :condition_id,            presence: true
  validates :shipping_charge_id,      presence: true
  validates :prefecture_id,           presence: true
  validates :days_to_ship_id,         presence: true
 
end
