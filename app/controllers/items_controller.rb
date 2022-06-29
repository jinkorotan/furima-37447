class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
   # ログインしていないユーザーをログインページの画面に促す
   before_action :set_item,  only: [:show, :edit, :update,]
   before_action :move_to_root_path, only: [:edit, :update,]


  def index
    @item = Item.order('created_at DESC')
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

  def show
  end

  def edit
    #updateと一組で編集を行う。まずは編集ページへ遷移する処理を行う
  end

  def update
    #editと一組で編集を行う
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end 
  end 

  def destroy
      item =Item.find(params[:id])
      item.destroy
  end  

  private
    def item_params
      params.require(:item).permit(:name, :price, :description, :category_id, :condition_id, :shipping_charge_id,
                                  :prefecture_id, :days_to_ship_charge_id, :image).merge(user_id: current_user.id)
    end
    
    def set_item
    @item = Item.find(params[:id])
    end

    def move_to_root_path
      unless current_user == @item.user
        redirect_to root_path
      end 
    end
    #現在ログインしているユーザーが商品を出品ユーザーではなかった時トップページに遷移する
end
