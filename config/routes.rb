Rails.application.routes.draw do
  #static pages
  get 'welcome/:user_entry', to: 'welcome#show'
  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'

  root 'static_pages#index'
  resources :gossips do
    resources :comments
  end
  resources :users
  resources :cities
end
