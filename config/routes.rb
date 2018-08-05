Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :posts, only: [:show, :index] do
    resources :comments, only: [:show, :index]
  end
  resources :comments, only: [:show, :index] do
    resources :comments, only: [:show, :index]
  end
  resources :galleries, only: [:show, :index]
  resources :employees, only: :index
  root 'posts#home'
  get '/blog' => 'posts#index'
  get '/events' => 'posts#events'
  get '/team' => 'employees#index'

  namespace :admin do
    root 'dashboards#index'
    resources :galleries do
      resources :gallery_images
    end
    resources :categories
    resources :posts do
      resources :comments
    end
    resources :comments do
      resources :comments
    end
    resources :users
    resources :galleries
    resources :employees
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/:page' => 'static#show'

  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
