class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  # ログインしていないユーザーをログインページの画面に促す
  def index
    @item =Item.all
   #.allで上から順に取ってくるということになる
  end

  def new
    @item = Item.new
    # @itemは空の状態。
    # 新規作成ボタンをクリックしたらnewアクションが働く
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      # 保存に成功したら
      redirect_to root_path
      # redirect_toメソッドでルートパスにリダイレクト
    else
      render :new
      # 保存が失敗した場合はrenderメソッドでitem_/new.html.erbのページを表示
    end
  end

  private
      def item_params  
        params.require(:item).permit(:name, :price, :description, :category_id , :condition_id, :shipping_charge_id , :prefecture_id ,:days_to_ship_id , :image ).merge(user_id: current_user.id)
      end
end
