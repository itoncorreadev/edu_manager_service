# frozen_string_literal: true

require "sidekiq/web"

Rails.application.routes.draw do
  secret_key = Rails.root.join(".sidekiq_session.key").read.chomp
  Sidekiq::Web.use ActionDispatch::Cookies
  Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: "_edu_manager_service_session", secret: secret_key

  mount Sidekiq::Web => "/sidekiq"

  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users

  # Cursos
  resources :courses
  # Diciplina: dentro de um curso
  resources :subjects
  # Lições: dentro de um Assunto
  resources :lessons
  # Tarefas: dentro de uma Lição
  resources :assignments
  # Entregas: de uma Tarefa
  resources :submissions
  # Materiais: de uma Lição
  resources :materials

  # Incrições: independentes
  resources :enrollments, only: %i[create index]

  # Usuários
  resources :users, only: %i[index show create update destroy]

  resources :enrollments, only: %i[create index]
end
