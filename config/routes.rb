ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.index '/', :controller => 'courses', :action => 'index'
  map.logout "/sessions/logout", :controller => "sessions", :action => "destroy"
  
  map.resources :users
  map.resources :sessions
  map.resources :registrations
   map.resources :courses do |course|
     course.resources :exams
     course.resources :course_instances do |ci|
       ci.resources :exercise_groups
     end
   end
  map.resource :mailer, :controller =>"mailer"

   map.namespace(:admin) do |admin|
    admin.resources :users
    admin.resources :courses
    admin.resources :course_instances
    admin.resources :exercise_groups
    admin.resources :newsfeeds
    admin.resources :registrations
    admin.resources :exams
    admin.resources :notices
    admin.resources :newsfeed_likes
  end

  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
