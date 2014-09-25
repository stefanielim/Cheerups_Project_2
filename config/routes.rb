CheerupsApp::Application.routes.draw do
  devise_for :users,:controllers => { :omniauth_callbacks => "omniauth_callbacks"}
  devise_for :users
  
  root to: "cheerups#index"
  resources :users
  resources :cheerups

  resources :cheerups do
    member do
      put 'vote/:direction', to: 'cheerups#vote', as: 'vote'
    end

    collection do 
      match 'search'=> "cheerups#search" , via: [:get, :post] , as: :search  
      get 'display/:display', to: 'cheerups#display', as: 'display'
    end
  end
end