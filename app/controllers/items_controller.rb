class ItemsController < ApplicationController

  def index
  end
   
  def new
    @item = Item.new
     #@itemは空の状態。
     #新規作成ボタンをクリックしたらnewアクションが働く
  end
end