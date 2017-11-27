Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
    #users 
    devise_for :users, controllers: { 
        confirmations: 'users/confirmations',
        passwords: 'users/passwords',
        registrations: 'users/registrations',
        sessions: 'users/sessions',
        unlocks: 'users/unlocks'
    }

    as :user do  
        get 'users/sign_out' => 'users/sessions#destroy'
        get 'users/settings' => 'users#edit'
        get 'users/:id' => 'users#show'
    end

    resources :users, only: [:show]



    #resources & tags  
    resources :resources 

    resources :tags, only: [:create]
    resources :resource_tags, only: [:create, :destroy]

    #reviews 
    resources :reviews

    #categories
    resources :categories, only: [:index, :show]


    root to: "categories#index"

end
