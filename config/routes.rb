Rails.application.routes.draw do
  root "welcome#index"
  devise_for :passes

  get 'goal/index'

  post 'goal/create'

  get 'goal/new'
  get 'goal/:id/show'       => 'goal#show',         :as=> 'show_goal'
  get 'goal/:id/destroy'    => 'goal#destroy',      :as=> 'destroy_goal'
  get 'goal/:id/edit'       => 'goal#edit',         :as=> 'edit_goal'
  


  get '/user/newgoal'       => 'welcome#new_goal',  :as=> 'newgoal'

  get  'logout'              => 'user#logout',       :as=> 'logout'
  get  'login'               => 'user#login',       :as=> 'login'
  get  'register'            => 'user#sign_up',      :as=> 'register'
  post 'user/create'         => 'user#create'
  post 'user/user_sign_in'   => 'user#user_sign_in', :as=> 'sign_in'

  get 'user/index'      => 'userpage#index',      :as=> 'user_path'

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
