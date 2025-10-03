require 'sidekiq/web'

Rails.application.routes.draw do
  secret_key = File.read(Rails.root.join('.sidekiq_session.key')).chomp
  Sidekiq::Web.use ActionDispatch::Cookies
  Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: '_edu_manager_service_session', secret: secret_key

  mount Sidekiq::Web => '/sidekiq'

  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users

  resources :courses do
    resources :subjects do
      resources :lessons do
        resources :assignments
      end
    end
  end

  resources :enrollments, only: [:create, :index]
end
