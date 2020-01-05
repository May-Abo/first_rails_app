Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'welcome#home'
  get 'about', to: 'welcome#about'
  
  get '/s/:slug', to: 'links#view', as: :short
  
  resources :articles
  resources :links
  
end
