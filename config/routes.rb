Rails.application.routes.draw do
  root to: "attendances#top"
  devise_for :users

  resources :materials, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      get :result
    end
  end

  resources :attendances, only: [:index, :new, :create] do
    collection do
      get :top
      get :show_date
      patch :update_multiple
    end
  end

  resources :workers, only: [:new, :create]
  resources :vehicles, only: [:new, :create]
end
