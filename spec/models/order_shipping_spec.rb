require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '送付先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @donation_address = FactoryBot.build(:order_shipping, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_shipping).to be_valid = ''
      end
      it 'building_nameは空でも保存できること' do
        @order_shipping.building_name
        expect(@order_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      end
      it 'prefecture_idを選択していないと保存できないこと' do
      end
      it 'municipalityが空だと保存できないこと' do
      end
      it 'addressが空だと保存できないこと' do
      end
      it 'phone_numberが空だと保存できないこと' do
      end
      it 'phone_numberが半角数値のみ保存可能なこと' do
      end
      it 'phone_numberが10桁以上11桁以内のみ保存可能なこと' do
      end
      it 'userが紐付いていないと保存できないこと' do
      end
      it 'itemが紐付いていないと保存できないこと' do
      end
end
