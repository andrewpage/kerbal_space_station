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

  get "/search" => "pages#search", as: :search

  root to: "pages#splash"
end
