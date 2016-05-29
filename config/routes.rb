Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }, :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :skip => [:sessions]

  as :user do
    match "login",  :to => "sessions#new",     :via => :get, :as => :new_user_session
    match "logout", :to => "sessions#destroy", :via => :delete, :as => :destroy_user_session
  end

  root "pages#index"
  resources :recipes
end
