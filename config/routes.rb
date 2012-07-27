SampleApp::Application.routes.draw do
  resources :medidas

  resources :areas

  resources :articulos

  resources :reparaciones

  resources :estados

  devise_for :useres

  resources :fallas

  resources :activos

  resources :categorias

  get "home/index"
  root :to => 'home#index'

end
