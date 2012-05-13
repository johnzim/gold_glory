GoldGlory::Application.routes.draw do




  get "coaches/seed"

  get "coaches/buy"
   
  
  get "users/new"

  get "pages/home"

  get "pages/contact"

  get "pages/about"

  match '/contact', :to => "pages#contact"
  match '/about', :to => "pages#about"
  match '/tpspend', :to => "pages#tpspend"
  match '/admin_dashboard', :to => "pages#admin_dashboard"
  match '/marketplace', :to => "pages#marketplace"
  

  resources :users

  resources :sessions, :only => [:new, :create, :destroy]

  resources :spamposts do
    post :create
  end

  resources :coaches do
  	member do
  		get :name_edit
  	end
  end

  resources :athletes do
    member do
      post :create
      get :name_edit
    end
  end
  
#  resources :gamestate do
 #   member do
  #    post :generate_athletes
   # end
  #end

  match '/generate', :to => 'gamestate#generate_athletes'
  match '/activate_creation', :to => 'gamestate#activate_creation'
  match '/deactivate_creation', :to => 'gamestate#deactivate_creation'
  match '/activate_help_tips', :to => 'gamestate#activate_help_tips'
  match '/seed_unemployed_pool', :to => 'gamestate#seed_unemployed_pool'
  match '/deactivate_help_tips', :to => 'users#deactivate_help_tips'


  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  root :to => "pages#home"


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
