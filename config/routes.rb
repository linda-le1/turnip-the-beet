Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/auth/spotify/callback', to: 'sessions#create'
  get '/recommendations/new', to: 'recommendations#new'
end
