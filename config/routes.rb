KerbalSpaceStation::Application.routes.draw do
  devise_for :accounts

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

  root to: "pages#splash"
end
