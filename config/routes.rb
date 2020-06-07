Rails.application.routes.draw do

  devise_for :owners, :controllers => {
    :sessions => 'owner/devise/sessions'
  }

  devise_for :members, :controllers => {
    :sessions => 'members/sessions',
    :registrations => 'members/registrations'
  }
  #顧客
  scope module: :members do
  #homeコントローラ
  root 'home#top'
  get 'home/about'

  #membersコントローラ
  resource :members,only: [:show,:update,:destroy] do
     member do
       get :exit
     end
  end

  get 'member/edit', to: 'members#edit'
  #productsコントローラ

  resources :products,only: [:show,:index]

  #cartsコントローラ
   resources :carts,only: [:index,:create,:update,:destroy] do
     collection do
    delete '/', to: 'carts#destroy_all'
   end
   end

    #ordersコントローラ
    resources :orders,only: [:index,:show,:new,:create]
    get 'order/confirm', to: 'orders#confirm'
    get 'order/complete', to: 'orders#complete'

    #ordered_productsコントローラ
    resources :ordered_products,only: [:create]

    #destinationsコントーラ
    resources :destinations,only: [:index,:edit,:create,:update,:destroy]
  end
  #管理者
  namespace :owner do
    #topコントローラ
    get 'home/top'
    #productsコントローラ

    resources :products,only: [:index,:new,:show,:edit,:create,:update]

    #genresコントローラ
    resources :genres,only: [:index,:show,:edit,:create,:update]

    #ordersコントローラ
    resources :orders,only: [:index,:show,:update]

    #ordered_productsコントローラ
    resources :ordered_products,only: [:update]

    #membersコントローラ
    resources :members,only: [:index,:show,:edit,:update]
  end
end