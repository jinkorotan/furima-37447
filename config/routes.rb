Rails.application.routes.draw do
  # トップページの表示をツイートの一覧ページにする
  # resources :items, only: :index
  root to: "items#index"
end

