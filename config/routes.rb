CheerupsApp::Application.routes.draw do
  devise_for :users,:controllers => { :omniauth_callbacks => "omniauth_callbacks"}
  devise_for :users
<<<<<<< HEAD
  root to:   "users#index"
  resources   :users
=======
  root to: "users#index"
  resources :users
  resources :cheerups
>>>>>>> anand
end
