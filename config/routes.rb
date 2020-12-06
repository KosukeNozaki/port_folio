Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions'}
  devise_for :customers, controllers: {registrations: 'publics/registrations', sessions: 'publics/sessions'}
  scope module: :public do
    get 'homes/top'
    get 'homes/about'
    resources :customers, except: [:new, :destroy ]
    resources :cards, only: [:index, :show ]
    resources :cart_cards, only: [:index, :update, :destroy, :create]
    resources :orders, except: [:edit, :update, :destroy,]
    resources :deliverys, only: [:index, :edit, :create, :update, :destroy]
  end
  namespace :admins do
    get 'homes/top'
    resources :cards
    resources :genres, only: [:index, :create, :edit, :update, :destroy ]
    resources :customers, only: [:index, :show, :edit, :update ]
    resources :orders, only: [:index, :show, :update ]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
