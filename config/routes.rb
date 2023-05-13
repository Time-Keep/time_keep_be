Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
      namespace :v1 do
        get '/counties', to: 'counties#index'
        get '/docker/counties', to: 'counties#docker_index'
      end
    end
end
