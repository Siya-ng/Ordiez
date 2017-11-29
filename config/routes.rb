Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders, only: [:index,:create] do
    resources :feedback
  end
  root 'orders#index'



  get 'orders/:order_id', to: 'orders#show'
end
