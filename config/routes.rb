Rails.application.routes.draw do
  scope module: :public do
    get 'homes/root'
    get 'homes/about'
    resources :customers, except: [:new, :destroy ]
    resources :cart_cards, only: [:index, :update, :destroy, :create]
    resources :orders, except: [:edit, :update, :destroy,]
    resources :deliverys, only: [:index, :edit, :create, :update, :destroy]
  end
  namespace :admins do
    get 'homes/top'
    resources :cards
    resources :genres, only: [:index, :create, :edit, :update ]
    resources :customers, only: [:index, :show, :edit, :update ]
    resources :orders, only: [:index, :show, :update ]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
