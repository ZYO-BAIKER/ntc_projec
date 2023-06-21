Rails.application.routes.draw do
  root to: "attendances#top"
  devise_for :users

  resources :materials, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      get :result
    end
  end

  resources :workers, only: [:index]

  resources :attendances, only: [:index, :new] do
    collection do
      get :top
      post :create_multiple
      get :show_date
      patch :update_multiple
    end
  end
end
