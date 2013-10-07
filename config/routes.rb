Kvazars::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'game#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  # resources :users

  get 'signout' => "game#signout"
  get 'signup' => "game#signup"
  get 'signin'  => "game#signin"

  namespace :game do
    
    
    # Buildins
    get 'building/:planet_id/build/:building_type', to: 'building#build', as: 'build_planet_building'
    get 'building/:planet_id/list', to: 'building#list', as: 'building_list'
    
    # Technologies
    get 'technology/:technology_type/build', to: 'technology#build', as: 'build_technology'
    get 'technology/list', to: 'technology#list', as: 'technology_list'
    
    # Planets
    get 'planet/:planet_id/buildings' => 'building#list'
    get 'planet/index', to: 'planet#index', as: 'planets_index'
    get 'planet/:planet_id/show', to: 'planet#show', as: 'planet_show'

    # Ships
    get 'ship/:planet_id/list', to: 'ship#list', as: 'ship_list'
    get 'ship/:planet_id/build/:ship_type', to: 'ship#build', as: 'build_ship'

    # resources :profile
    # resources :planet do
      
    #   get 'show'
    # end
    # resources :building do
    #   get 'index'
    #   get 'list'
    # end
    # resources :technology do
    #   get 'index'
    # end
  end
  


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
     namespace :admin do
       # Directs /admin/products/* to Admin::ProductsController
       # (app/controllers/admin/products_controller.rb)
       resources :users
     end
end
