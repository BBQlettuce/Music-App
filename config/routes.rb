Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]

  resources :bands do
    resources :albums, only: :new
  end

  resources :albums, only: [:create, :show, :edit, :update, :destroy] do
    resources :tracks, only: :new
  end

  resources :tracks, only: [:create, :show, :edit, :update, :destroy] do
    resources :notes, only: :create
  end

  resources :notes, only: [:edit, :update, :destroy]

  root to: "bands#index"
end
