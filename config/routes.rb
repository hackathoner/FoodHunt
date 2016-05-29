Rails.application.routes.draw do

  root "pages#index"

  devise_for :users,
             :skip         => [:sessions],
             :controllers  => { :omniauth_callbacks => "users/omniauth_callbacks" }

  as :user do
    match "login",   :to => "sessions#new",      :via => :get,     :as => :new_user_session
    match "logout",  :to => "sessions#destroy",  :via => :delete,  :as => :destroy_user_session
  end

  resources :recipes

  resources :votes, :only => [] do
    post :toggle,   :on => :member, :as => :toggle
    post :create,   :on => :member, :as => :create
    post :destroy,  :on => :member, :as => :destroy
  end
end
