Rails.application.routes.draw do
  resources :restaurants do
    # GET restaurants/1/reviews/new new
    # POST restaurants/1/reviews create
    resources :reviews, only: [:new, :create]
    
    
    # GET restaurants/top
    collection do
      get :top
    end

    # GET restaurants/:id/chef
    member do
      get :chef
    end


  end
  resources :reviews, only: :destroy


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end



