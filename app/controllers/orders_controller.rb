class OrdersController < ApplicationController

  before_action :set_item,  only: [:index, :create]

  def index
   #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
   #order/indexに使いたい情報をここで@itemに入れる
   @order_shipping = OrderShipping.new
   #２重ハッシュの空の箱ができた
  end
  
  # order_shippingの保存
  def create
   
    @order_shipping = OrderShipping.new(order_shipping_params)
    
    if @order_shipping.valid?
      @order_shipping.save
      #order_shippingモデルのsaveを呼び出す
      #フォームオブジェクトの保存
      return redirect_to root_path
    else
    render 'index'
    end
  end

  private
  def order_shipping_params
    params.require(:order_shipping).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id] ) 
  end

  def set_item
    @item = Item.find(params[:id])
    end
end
