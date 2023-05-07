Rails.application.routes.draw do
  root to: "attendances#top"
  devise_for :users
  resources :materials, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      get :result
    end
  end
  resources :attendances, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      get :top
    end
  end
end
