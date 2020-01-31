Rails.application.routes.draw do
  root                'static_pages#home'
  get    'concept' => 'static_pages#concept'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'timeline'=> 'users#timeline'
  get    'show_by_type'=> 'microposts#show_by_type'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :likes, only: [:create, :destroy]
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:show, :create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
