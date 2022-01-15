Rails.application.routes.draw do
  devise_for :users
  root to: "materials#index"
  resources :materials, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      get :result
    end
  end
end
