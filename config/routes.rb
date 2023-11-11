Rails.application.routes.draw do

  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy] #いいねのIDをURLに含める必要はない。resourceを使用するとほかのリソースとの関連付けに寄って特定できる
  end
  resources :users, only: [:index, :show, :edit, :update]
  root to: 'homes#top'
  get 'homes/about' => 'homes#about'
  get "home/about" => 'homes#about', as:'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
