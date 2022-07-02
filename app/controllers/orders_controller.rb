class OrdersController < ApplicationController
  def index
   #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
   @order_shipping = OrderShipping.new
   @item = Item.find(params[:item_id])
   #order/indexに使いたい情報をここで@itemに入れる
  end
  

  def create
   
  end

  private
  def item_params
    params.require(:item).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number,
                                :order, :user_id, :item_id).merge(user_id: current_user.id)
  end
  
end
