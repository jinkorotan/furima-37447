require 'rails_helper'

RSpec.describe Item, type: :model do
 
    describe ‘出品の保存‘ do

      context '出品が保存できる場合' do
        @item = FactoryBot.build(:item)
      end

      context '出品が保存できない場合' do

        it  category_idが紐付いていなければ出品できない do
        end

        it  condition_idが紐付いていなければ出品できない do
        end
        it  shipping_charge_idが紐付いていなければ出品できない do
        end
        it  prefecture_idが紐付いていなければ出品できない do
        end

        it  days_to_ship_idが紐付いていなければ出品できない do
        end
      end

        nameが空では投稿できない
        priceが空では投稿できない
        descriptionが空では投稿できない
        imageが空（nil）では投稿できない


        priceが半角数値以外では保存できない

      end


    end
end
