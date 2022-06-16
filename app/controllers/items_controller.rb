class ItemsController < ApplicationController

   before_action :authenticate_user!, except: [:index]
  # ログインしていないユーザーをログインページの画面に促す
  def index
  end
   
  def new
    @item = Item.new
     #@itemは空の状態。
     #新規作成ボタンをクリックしたらnewアクションが働く
  end
end