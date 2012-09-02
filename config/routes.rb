SampleApp::Application.routes.draw do

  resources :naves

  resources :ordenes_servicios

  resources :relaciones_articulos_medida

  resources :agentes
  
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
