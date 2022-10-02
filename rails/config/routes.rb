Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: "dashboard#index"

  resources :user_balances, only: %i[show] do
    member do
      get :add
      get :sub
    end
  end
end
