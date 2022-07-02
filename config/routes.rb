Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :orders, only: [:create,:index]
    #createアクションとindexアクション両方を持たせ得たい時の書き方
    # ordersコントローラーを使って
  end
end