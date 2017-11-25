Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	devise_for :users, controllers: { sessions: 'users/sessions' }

	#users
    get 'users/:id' => 'users#show'
    
    #resources & tags  
    resources :resources 
    resources :tags, only: [:create]
    resources :post_tags, only: [:create, :destroy]

    #reviews 
    resources :reviews

    #categories
    resources :categories, only: [:index, :show]

    #sessions
    resources :sessions, only: [:create, :new] 

  root to: "categories#index"
end
