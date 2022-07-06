class OrdersController < ApplicationController


  def index
   #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
   @item = Item.find(params[:item_id])
   #order/indexに使いたい情報をここで@itemに入れる
   @order_shipping = OrderShipping.new
   #２重ハッシュの空の箱ができた
  end
  
  # order_shippingの保存
  def create
    binding.pry
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
    params.require(:order_shipping).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id]) 
  end
end
