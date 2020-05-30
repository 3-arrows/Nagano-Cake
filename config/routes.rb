Rails.application.routes.draw do

  devise_for :owners
  devise_for :members
  #顧客
  #homeコントローラ
  root 'home#top'
  get 'home/about'

  #membersコントローラ
  resources :members,only: [:show,:edit,:update,:destroy]
  get 'members/:id/exit', to: 'members#exit'

  #productsコントローラ
  resources :products,only: [:show,:index]

  #cartsコントローラ
  resources :carts,only: [:index,:create,:update,:destroy]
  delete 'members/carts', to: 'cars#destroy_all'

  #ordersコントローラ
  resources :orders,only: [:index,:show,:new,:create]
  get 'members/orders/confirm', to: 'orders#confirm'
  get 'members/orders/complete', to: 'orders#complete'

  #ordered_productsコントローラ
  resources :ordered_products,only: [:create]

  #destinationsコントーラ
  resources :destinations,only: [:index,:edit,:create,:update,:destroy]

  #管理者
  #topコントローラ
  get 'admin/top', to: 'top#top'

  #productsコントローラ
  namespace :owner do
  resources :products,only: [:index,:new,:show,:edit,:create,:update]
  end

  #genresコントローラ
  resources :genres,only: [:index,:new,:show,:edit,:create,:update]

  #ordersコントローラ
  namespace :owner do
  resources :orders,only: [:index,:show,:update]
  end

  #ordered_productsコントローラ
  namespace :owner do
  resources :ordered_products,only: [:update]
  end

  #membersコントローラ
  namespace :owner do
  resources :members,only: [:index,:show,:edit,:update]
  end
end
