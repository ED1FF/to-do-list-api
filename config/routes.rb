Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :users, only: %i[create show update]
  resources :sessions, only: :create
  resources :tasks, except: %i[edit new]
  resource :bulk_tasks, only: %i[destroy update]
end
