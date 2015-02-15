Rails.application.routes.draw do
  namespace 'api', defaults: { format: 'json' } do
    post :login, to: 'user_sessions#create'
  end
end
