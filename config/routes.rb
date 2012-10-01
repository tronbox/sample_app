SampleApp::Application.routes.draw do

  get "consultas/general"

  resources :naves

  resources :ordenes_servicios do
    member do
      get 'asigna'
    end
  end

  match "/consultas/general", :to => "consultas#general"
  
  resources :relaciones_articulos_medida

  resources :agentes
  
  #match "/agentes/reporte", :to => "agentes#reporte"
  
  resources :series

  resources :medidas

  resources :areas

  resources :articulos

  resources :reparaciones

  resources :estados

  devise_for :useres, :path_prefix => 'authorization'
  resources :useres

  resources :fallas

  resources :activos

  resources :categorias

  get "home/index"
  root :to => 'home#index'

end
