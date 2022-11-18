Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'users/index'
      get 'users/create'
      get 'users/update'
      get 'users/destroy'
      get 'users/show'
      resources :campaigns do 
        resources :comments
      end 
    end 
  end
  
end
 