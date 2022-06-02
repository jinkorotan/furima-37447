# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

class ApplicationController < ActionController::Base
end
# class PrototypesController < ApplicationController

#   before_action :authenticate_user!, except: [:index, :show]
#   # ログインしていないユーザーをログインページの画面に促す
#   before_action :contributor_confirmation, only: [:edit, :update,:destroy]
#    #ログインしていない状態で新規投稿画面へ直接アクセスしようとしても
#    #before_actionによりcontributor_confirmationメソッドが先に実行され
#    #トップページにリダイレクトする

#   def index
#     @prototypes= Prototype.includes(:user)
#     #includesメソッドを使用してN+1問題を解消
#     #includesメソッドを使用するとすべてのレコードを取得するため、allメソッドは省略
#   end

#   def new
#     @prototype= Prototype.new
#      #@prototypeは空の状態。
#      #新規作成ボタンをクリックしたらnewアクションが働く
#   end

#   def create
#     @prototype = Prototype.new(prototype_params)
#     if @prototype .save
#       #保存に成功したら
#       redirect_to root_path
#       #redirect_toメソッドでルートパスにリダイレクト
#     else
#       render :new
#       #current_user.createに失敗したら
#       #保存が失敗した場合はrenderメソッドでprototype/new.html.erbのページを表示
#     end
#   end 

#   def show
#     @prototype = Prototype.find(params[:id])
#     @comment = Comment.new
#     @comments = @prototype.comments
#   end

#   def edit
#     @prototype = Prototype.find(params[:id])
#   end

#   def update
#     @prototype = Prototype.find(params[:id])
#     if @prototype.update(prototype_params)
#        redirect_to prototype_path(@prototype)
#     else
#        render :edit
#         #更新が失敗した場合はrenderメソッドでprototype.edit.html.erbのページを表示
#     end
#   end


#   def destroy
#     @prototype = Prototype.find(params[:id])
#     if @prototype.destroy
#       redirect_to root_path
#     else
#       redirect_to root_path
#     end  
#   end


#   private
#     def prototype_params
#       params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
    
#     end


#     def contributor_confirmation
#       @prototype = Prototype.find(params[:id])
#       redirect_to root_path unless current_user == @prototype.user
#       # ユーザーがログインしていなかったらcontributor_confirmationアクションが実行される
#     end
# end

# class CommentsController < ApplicationController
#   def create
#     @comment = Comment.new(comment_params)
    
#     if @comment.save
#       redirect_to prototype_path(@comment.prototype) # コメントと結びつくプロトロタイプの詳細画面に遷移する
#     else   
#        @prototype= @comment.prototype
#        @comments = @prototype.comments
#       render "prototypes/show"   # データが保存されなかったときは詳細ページに戻る
#     end
#   end

#   private
#   def comment_params
#   params.require(:comment).permit(:content).merge(user_id:current_user.id, prototype_id: params[:prototype_id])
#   end
# end

# class Comment < ApplicationRecord
#   belongs_to :user
#   belongs_to :prototype
  
#   validates :content, presence: true
#   end
  
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,        presence: true
  validates :profile,     presence: true
  validates :occupation,  presence: true
  validates :position,    presence: true

  has_many :prototypes
  has_many :comments
     
end

class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image
 
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true 
  validates :image, presence: true 
 
  has_many :comments, dependent: :destroy
 
 end

 <div class="card">
  <%= link_to image_tag(prototype.image, class: :card__img ), prototype_path(prototype) %>
  <div class="card__body">
    <%= link_to prototype.title, prototype_path(prototype), class: :card__title%>
    <p class="card__summary">
      <%= prototype.catch_copy %>
    </p>
    <%= link_to "by #{prototype.user.name}", user_path(prototype.user), class: :card__user %>
  </div>
</div>

<div class="main">
  <div class="inner">
    <div class="form__wrapper">
      <h2 class="page-heading">プロトタイプ編集</h2>
      <%# 部分テンプレートでフォームを表示する %>
      <%= render partial: "form", locals: { prototype:  @prototype } %>
    </div>
  </div>
</div>

<main class="main">
  <div class="inner">
    <%# ログインしているときは以下を表示する %>
    <% if user_signed_in? %>
       <div class="greeting"> 
        こんにちは、
    <%= link_to "#{current_user.name}さん",user_path(current_user), class: :greeting__link %>
       </div> 
    <%# // ログインしているときは上記を表示する %>
    <% end %>
    <div class="card__wrapper">
      <%# 投稿機能実装後、部分テンプレートでプロトタイプ投稿一覧を表示する %>
       <%= render partial: 'prototype', collection: @prototypes %>
    </div>
  </div>
</main>


<div class="card">
  <%= link_to image_tag(prototype.image, class: :card__img ), prototype_path(prototype)%>
  <div class="card__body">
    <%= link_to prototype.title, prototype_path(prototype), class: :card__title%>
    <p class="card__summary">
      <%= prototype.catch_copy%>
    </p>
     <%= link_to "by #{prototype.user.name}", user_path(prototype.user), class: :card__user %> 
  </div>
</div>

<%= form_with model: prototype, local: true do |f|%>
  <div class="field">
    <%= f.label :title, "プロトタイプの名称" %><br />
    <%= f.text_field :title %>
  </div>

  <div class="field">
    <%= f.label :catch_copy, "キャッチコピー" %><br />
    <%= f.text_area :catch_copy, class: :form__text %>
  </div>

  <div class="field">
    <%= f.label :concept, "コンセプト" %><br />
    <%= f.text_area :concept, class: :form__text %>
  </div>

  <div class="field">
    <%= f.label :image, "プロトタイプの画像" %><br />
    <%= f.file_field :image %>
  </div>

  <div class="actions">
    <%= f.submit "保存する", class: :form__btn  %>
  </div>
<% end %>

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :prototype
  
  validates :content, presence: true
  end
  