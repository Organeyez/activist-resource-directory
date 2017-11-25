Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    devise_for :users, controllers: { registrations: 'registrations'}


    #resources & tags  
    resources :resources 
    resources :tags, only: [:create]
    resources :post_tags, only: [:create, :destroy]

    #reviews 
    resources :reviews

    #categories
    resources :categories, only: [:index, :show]


    root to: "categories#index"
end
