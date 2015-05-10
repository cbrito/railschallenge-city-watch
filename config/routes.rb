Rails.application.routes.draw do
  resources :responders, param: :name, only: [:index, :show, :create, :update], defaults: { format: :json }
  resources :emergencies, param: :code, only: [:index, :show, :create, :update], defaults: { format: :json }
end
