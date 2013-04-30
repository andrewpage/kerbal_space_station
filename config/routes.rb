KerbalSpaceStation::Application.routes.draw do
  devise_for :accounts

  resources :mods do
    resources :photos, only: [:create, :destroy]
  end

  root to: "pages#splash"
end
