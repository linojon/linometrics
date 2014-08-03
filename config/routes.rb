Rails.application.routes.draw do
 
  match 'events' => 'events#index', via: :options
  match 'events' => 'events#create', via: :post

  resources :sites
  root 'sites#index'
end
