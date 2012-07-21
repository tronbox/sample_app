SampleApp::Application.routes.draw do
  resources :categorias

  get "home/index"
  root :to => 'home#index'

end
