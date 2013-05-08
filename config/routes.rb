KerbalSpaceStation::Application.routes.draw do
  devise_for :accounts

  resources :downloadables

  resources :mods do
    member do
      get :download
      get :ignore
      get :bookmark
      get :like
      get :dislike
      get :report
    end
  end

  resources :crafts do
    member do
      get :download
      get :ignore
      get :bookmark
      get :like
      get :dislike
      get :report
    end
  end

  namespace :api do
    resources :documentations
  end

  get "/contact" => "pages#contact", as: :contact
  get "/security" => "pages#about", as: :security
  get "/privacy" => "pages#privacy", as: :privacy
  get "/tos" => "pages#tos", as: :tos
  get "/about" => "pages#about", as: :about
  get "/search" => "pages#search", as: :search

  root to: "pages#splash"
end
