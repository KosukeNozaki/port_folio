Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions'}
  devise_for :customers, controllers: { registrations: 'publics/registrations', sessions: 'publics/sessions'}

  scope module: :publics do
    resources :customers, except: [:new, :destroy ] do
      collection do
        patch :status
      end
    end
    resources :cards, only: [:index, :show ]
    resources :cart_cards, only: [:index, :update, :destroy, :create] do
      collection do
        delete 'all_destroy'
      end
    end
    resources :orders, except: [:edit, :update, :destroy,] do
        collection do
          post :confirm
          get :thanks
        end
    end
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    root 'homes#top'
    # 飛ばしたいコントローラー名#アクション名
    get '/about' => 'homes#about'
  end
  namespace :admins do
    resources :cards
    resources :genres, only: [:index, :create, :edit, :update, :destroy ]
    resources :customers, only: [:index, :show, :edit, :update ]
    resources :orders, only: [:index, :show, :update ]

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
