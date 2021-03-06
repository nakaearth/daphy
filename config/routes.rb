Rails.application.routes.draw do
  get 'top/index'

 #facebook login 
  get "/:provider/login"  => "sessions#new"
  get "/logout" => "sessions#destroy"
  get "/auth/:provider/callback" => "sessions#create" unless Rails.env.development?
  post "/auth/:provider/callback" => "sessions#create" if Rails.env.development?
  get "/auth/failure" => "sessions#failuer"

  namespace :daphy do
    resources :job_cards, param: :encoded_id do
      collection do
        get 'trashed'
        delete 'remove_all'
      end

      member do
        patch 'change_type'
        patch 'recovery'
        delete 'remove'
      end
    end
    resources :groups do
      resources :job_folders, param: :encoded_id
    end
  end

  namespace :admin do
    get 'top/index'
    resources :groups, only: [:index, :show, :new, :create, :update, :edit, :destroy] do
      member do
        put 'invite'
      end
    end

    resources :friends, only: [:index, :new, :show, :destroy] do
      collection do
        post 'friend_request'
        get 'confirm_friend_request'
        get 'request_registrations'
        post 'become_friend'
        get 'delete_relationship'
      end
    end
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'top#index'

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
