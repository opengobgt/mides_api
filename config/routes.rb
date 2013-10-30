MidesApi::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'home#index'
  
  get '/v1/api-docs(.format)', to: redirect('/api-docs.json')
  
  scope '/v1' do
    resources :departamentos, only: [:index, :show], defaults: {format: :json} do

      resources :municipios, only: [:index, :show], defaults: {format: :json} do
        resources :comunidades, only: [:index, :show], defaults: {format: :json}
        resources :escuelas, only: [:index, :show], defaults: {format: :json}
      end
      
      resources :escuelas, only: [:index, :show], defaults: {format: :json}
    end
    
    scope '/educacion' do
      resources :escuelas, only: [:index, :show], defaults: {format: :json} do
        resources :estudiantes, only: [:index, :show], defaults: {format: :json}
      end
      
      resources :estudiantes, only: [:index, :show], defaults: {format: :json} do
        resource :familia, only: [:show], defaults: {format: :json}
        resources :asistencias, only: [:index], defaults: {format: :json}
      end
      
      resources :familias, only: [:index, :show], defaults: {format: :json} do
        get 'miembros' => 'estudiantes#index', defaults: {format: :json}
      end
      
      resource :asistencias, only: [:create], defaults: {format: :json}
      
      scope '/estadisticas' do
        get 'resumen' => 'estadisticas#show', defaults: {format: :json}, as: :estadisticas_resumen
        get 'estudiante/:id' => 'estadisticas_estudiante#show', defaults: {format: :json}, as: :estadisticas_estudiante
      end
    end

    resource :sesion, only: [:new, :create, :destroy], defaults: {format: :json}
    
  end
  
  
  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:1
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
