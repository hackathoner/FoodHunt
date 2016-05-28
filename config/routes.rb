Rails.application.routes.draw do

  devise_for :users, :controllers => {:sessions => "sessions", :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    match "login",  :to => "sessions#new",     :via => :get,    :as => :new_user_session
    match "logout", :to => "sessions#destroy", :via => :delete, :as => :destroy_user_session
  end

  root "pages#index"
  resources :recipes
end
