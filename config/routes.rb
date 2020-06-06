Rails.application.routes.draw do
  get 'entries/index'
  get 'entries/show'
  get 'entries/new'
  get 'entries/edit'
  get 'passwords/edit'
  get 'accounts/show'
  get 'accounts/edit'
  root "top#index"
  get "about" => "top#about", as: "about"
  
  resources :members do
    get "search", on: :collection
    resources :entries, only: [:index]
  end
  
  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update]
  resource :password, only: [:show, :edit, :update]
  
  resources :articles
  resources :entries do
    patch :like, :unlike, on: :member
    get :voted, on: :collection
  end
    
end

