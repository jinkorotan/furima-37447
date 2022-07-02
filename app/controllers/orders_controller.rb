class OrderController < ApplicationController
  def index
   #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
   @order_shipping = OrderShipping.new(order_params)
  end
  
  # def create
  #   binding.pry
  # end

end
