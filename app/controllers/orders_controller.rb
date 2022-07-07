class OrdersController < ApplicationController

  def index
   #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
   #order/indexに使いたい情報をここで@itemに入れる
   @order_shipping = OrderShipping.new
   @item = Item.find(params[:item_id])
   #２重ハッシュの空の箱ができた
  end
  
  # order_shippingの保存
  def create
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new(order_shipping_params)

    # if @order_shipping.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]     # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        
        amount: @item.price,                    # 商品の値段
        card: order_shipping_params[:token],    # カードトークン
        currency: 'jpy'                         # 通貨の種類（日本円）
      )

      @order_shipping.save
      #order_shippingモデルのsaveを呼び出すs
      #フォームオブジェクトの保存
      return redirect_to root_path
    # else
    # render 'index'
    # end
  end

  private
  def order_shipping_params
    params.require(:order_shipping).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number,:token).merge(user_id: current_user.id, item_id: params[:item_id]  ) 
  end
end
