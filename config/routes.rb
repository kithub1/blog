Rails.application.routes.draw do
  root "top#index"
  get "about" => "top#about", as: "about"
  
  get 'study' => 'study#index'
  post "study" => "study#create"
  

  resources :members , only: [:index, :show] do
    get "search", on: :collection
    resources :entries, only: [:index]
    resources :studies
  end
  
  resources :studies
  
  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update]
  resource :password, only: [:show, :edit, :update]
  
  resources :articles, only: [:index, :show]
  resources :entries do
    patch :like, :unlike, on: :member
    get :voted, on: :collection
  end
  
  namespace :admin do
    root "top#index"
    resources :members do
      get "search", on: :collection
    end
    resources :articles
  end  
end

