Rails.application.routes.draw do
  # Rotas Devise e raiz
  devise_for :users
  root to: "pages#home"

  # Rotas da API
  patch '/api/v1/podcasts/:id', to: 'api/v1/podcasts#update'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :podcasts, only: [:index, :show, :update, :create,:destroy]
    end
  end
end
