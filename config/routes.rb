Votefolio::Application.routes.draw do
  root to: "top#show"
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  devise_scope :user do
    get "sign_in", to: "devise/sessions#new", as: :new_user_session
    get "sign_out", to: "devise/sessions#destroy", as: :destroy_user_session
  end

  resources :users do
    resources :polls do
      resources :items
      resources :votes, only: [:index, :create]
    end
  end
end
