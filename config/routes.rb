CheerupsApp::Application.routes.draw do
  devise_for :users,:controllers => { :omniauth_callbacks => "omniauth_callbacks"}
  devise_for :users
  post 'users/create_test_users_data'
  root to: "cheerups#index"
  resources :users

  resources :cheerups do
    member do
      put 'vote/:direction', to: 'cheerups#vote', as: 'vote'
    end

    collection do 
      match 'search'=> "cheerups#search" , via: [:get, :post] , as: :search  
      get '/:display', to: 'cheerups#display', as: 'display'
    end
  end

end
