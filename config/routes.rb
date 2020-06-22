Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "callbacks"}
  devise_scope :user do 
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end
  root 'welcome#home'
  resources :lists, only: [:show, :index, :edit, :update, :destroy, :new]
  resources :lists do 
    resources :categories, only: [:new, :update,]
    resources :items
  end
  resources :list, only: [:new, :show, :edit, :update, :destroy]
  resources :items
  resources :list_items, only: [:index, :new, :show, :edit, :update, :destroy]

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
