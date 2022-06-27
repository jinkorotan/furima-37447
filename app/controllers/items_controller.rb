class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # ログインしていないユーザーをログインページの画面に促す
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
    @item = Item.find(params[:id])
  end


  def edit
  @item = Item.find(params[:id])
  end

  # def update
  #   @item = Item.find(params[:id])
  #     if  @item.update(item_params)
  #       redirect_to item_path(@item)
  #     else
  #       render :edit
  #         #更新が失敗した場合はrenderメソッドでedit.html.erbのページを表示
  #     end
  #   end 

  # def destroy
  #     item =Item.find(params[:id])
  #     item.destroy
  # end  

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id, :condition_id, :shipping_charge_id,
                                 :prefecture_id, :days_to_ship_charge_id, :image).merge(user_id: current_user.id)
  end
end
