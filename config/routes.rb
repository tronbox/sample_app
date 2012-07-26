SampleApp::Application.routes.draw do
  devise_for :useres

  resources :fallas

  resources :activos

  resources :categorias

  get "home/index"
  root :to => 'home#index'

end
