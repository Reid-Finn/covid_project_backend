Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :states, only: [:create]
      resources :comments, only: [:index, :create]
    
    end
  end
end