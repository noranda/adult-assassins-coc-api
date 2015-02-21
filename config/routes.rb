Rails.application.routes.draw do
  namespace 'api', defaults: { format: 'json' } do
    post :login, to: 'user_sessions#create'

    resources :users, only: [:create, :show]
    resources :wars, only: [:index, :show, :create]
    resources :timers, only: [:index, :create]
  end
end
