Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/auth/spotify/callback', to: 'sessions#create'
  resources :recommendations, only: [:create, :new, :index] 
  
  namespace 'recommendations' do
    get '/random', to: 'random#index'
  end

  delete '/sessions/:id', to: 'sessions#destroy'
end
