Guide::Application.routes.draw do


  mount RedactorRails::Engine => '/redactor_rails'


  resources :users
  resources :sessions
  resources :categories
  resources :posts

  match '/' , :to =>'main#list' #index
  match '/home' , :to =>'main#home' #index

  match '/menu', :to => 'staff#index' 
  match '/signout', :to => 'sessions#destroy'
  match '/signup',  :to => 'users#new'
  match 'user/:id/edit', :to =>'users#edit'
  match 'main/view_post/:id' , :to =>'main#view_post'
  match 'staff/view_post/:id' , :to =>'staff#view_post'

  match 'posts/:id' ,:to=>'posts#show' 
  match 'posts/:id' , :to =>'posts#show'
  match '/con',:to =>'sessions#new'


  get "staff/index"
  get "staff/login"
  get "staff/menu"
  get "staff/logout"


  get "main/index"
  get "main/list"
  get "main/category"
  get "main/archive"

  post "post/list"
  post "posts/list"
  post "posts/show"
  post "posts/new"

  get "users/edit"

  get "category/list"
  get "categories/list"



 
 
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
