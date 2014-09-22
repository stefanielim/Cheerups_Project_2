CheerupsApp::Application.routes.draw do
  devise_for :users,:controllers => { :omniauth_callbacks => "omniauth_callbacks"}
  devise_for :users
  post 'users/create_test_users_data'
  root to: "users#index"
  resources :users

  resources :cheerups do
    member do
      put 'vote/:direction', to: 'cheerups#vote', as: 'vote'
    end
  end

end
