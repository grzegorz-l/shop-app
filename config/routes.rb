ShopApp::Application.routes.draw do
  devise_for :admins

  resources :admin_panel
  resources :products
  resources :orders
  
  match ':controller(/:action)' 
  match ':controller(/:action(/:id))'
  
  resources :store
  root :to => "store#index"
  
end
