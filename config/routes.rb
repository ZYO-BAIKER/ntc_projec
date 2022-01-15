Rails.application.routes.draw do
  root to: "materials#index"
  devise_for :users
  resources :materials, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      get :result
    end
  end
end
