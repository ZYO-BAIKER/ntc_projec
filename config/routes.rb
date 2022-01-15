Rails.application.routes.draw do
  root to: "materials#index"
  resources :materials, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      get :result
    end
  end
end
