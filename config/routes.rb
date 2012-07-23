SampleApp::Application.routes.draw do
  resources :fallas

  resources :activos

  resources :categorias

  get "home/index"
  root :to => 'home#index'

end
