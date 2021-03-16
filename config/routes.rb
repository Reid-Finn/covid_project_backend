Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :states, only: [:create]
      resources :comments, only: [:index, :create]
    
    end
  end
  get '/api/v1/comments/states/:name', to: 'api/v1/comments#get_states' 
end