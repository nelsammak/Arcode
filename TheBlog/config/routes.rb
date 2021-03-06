Rails.application.routes.draw do


  resources :photos

resources :users

  resources :articles do 
    resources :comments
  end


  root 'static_pages#home'

  get 'static_pages/home' => 'static_pages#home'
  get 'Israa' => 'static_pages#Israa'
  get 'Karim' => 'static_pages#Karim'
  get 'Merna' => 'static_pages#Merna'
  get 'Mina' => 'static_pages#Mina'
  get 'Mohamed' => 'static_pages#Mohamed'
  get 'Nada' => 'static_pages#Nada'
  get 'Omar' => 'static_pages#Omar'
  get 'Aboutus' => 'static_pages#Aboutus'

  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get '/bycategory' => 'articles#bycategory', as: :bycategory
  get '/addcategory/:article_id' => 'articles#addcategory', as: :addcategory
  post '/addcategory/:article_id' => 'articles#addcategory2', as: :addcategory2

  #get 'sessions/new'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
