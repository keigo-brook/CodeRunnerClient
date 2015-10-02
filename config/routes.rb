Rails.application.routes.draw do
  root 'games#index'

  resources :games do
    resources :game_apis do
      member do
        post :send_params
      end
      collection do
        get :add_param
        get :execute_create_methods
      end
    end
  end

  resources :users
end
