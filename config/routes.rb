Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'videos#index'

  defaults format: :html do
    resources :videos, only: %i[index show]
    resource :login, only: %i[new create]
  end
end
