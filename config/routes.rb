Rails.application.routes.draw do

  resources :participante_proyectos
  get 'empleados_empresas/new'
  get 'empleados_empresas/edit'

  resources :licitacion_imagenes
  resources :producto_imagenes
  resources :licitacions

  resources :proyecto_imagenes  do
    match :make_default, :via => [:get, :post], :on => :member
  end
  #get 'proyecto_imagenes/make_default/:id' => 'proyecto_imagenes#make_default', :as => :make_default_proyecto_imagenes

  resources :proyectos
  get 'proyectos_buscar', to: 'proyectos#search'

  resources :experiencias
  resources :proyectos_categorias
  resources :estudios
  root 'static_pages#inicio'
  get 'pages_buscar', to: 'static_pages#search'

  resources :productos
  resources :vacantes_trabajos
  resources :industrias
  resources :empresas do
    resources :reviews, except: [:show, :index]
    get :avatar
  end
  get 'empresas_buscar', to: 'empresas#search'

  resources :industria
  resources :profesionales do
    resources :reviews, except: [:show, :index]
    get :avatar
  end
  get 'profesionales_buscar', to: 'profesionales#search'

  resources :profesiones
  resources :empleados_empresas

  #resources :pictures
  resources :tags, only: [:index, :show]

  post "/proyectos/new" => "proyectos#new", :as => :proyectos_new
  post "/productos/new" => "productos#new", :as => :productos_new
  post "/empleados_empresas/new" => "empleados_empresas#new", :as => :empresas_new
  post "/vacantes_trabajos/new" => "vacantes_trabajos#new", :as => :vacantes_trabajos_new
  post "/licitacions/new" => "licitacions#new", :as => :licitacions_new

  #para autorizar empleado
  get '/aceptar_solicitud_empleado/:id', to: 'empleados_empresas#aceptar_solicitud_empleado', as: 'aceptar_solicitud_empleado'
  get 'static_pages/terminos'

  controller :static_pages do
    get :nosotros
    get 'contacto', to: 'static_pages#contacto_new', as: 'contacto'
    post 'contacto', to: 'static_pages#contacto_create'
    get :privacidad
    get :terminos
  end

  # mailbox folder routes
  get "mailbox/notifications" => "mailbox#notifications", as: :mailbox_notifications
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  # conversations
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  #Blog
  resources :blog

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admins
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


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
