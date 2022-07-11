class OrdersController < ApplicationController

  before_action :authenticate_user!
   # ログインしていないユーザーをログインページの画面に促す
   before_action :set_item,  only: [:index, :create]
   before_action :move_to_root_path, only: [:index, :create]
   before_action :sold_out_root_path, only: [:index, :create]

  def index
   #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
   #order/indexに使いたい情報をここで@itemに入れる
   @order_shipping = OrderShipping.new
   #２重ハッシュの空の箱ができた
  end
  
  # order_shippingの保存
  def create
    @order_shipping = OrderShipping.new(order_shipping_params)

    # if @order_shipping.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]     # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        
        amount: @item.price,                    # 商品の値段
        card: order_shipping_params[:token],    # カードトークン
        currency: 'jpy'                         # 通貨の種類（日本円）
      )

      @order_shipping.save
      #order_shippingモデルのsaveを呼び出す
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

  def set_item
    @item = Item.find(params[:item_id])
  end


  def move_to_root_path

    if current_user == @item.user
      redirect_to root_path
    end 
  end
  #現在ログインしているユーザーが商品を出品ユーザーではなかった時トップページに遷移する

  def sold_out_root_path 
    binding.pry
    if  @item.order.present?
      redirect_to root_path
    end 
   #sold outだったらトップページに遷移する
  end
end




