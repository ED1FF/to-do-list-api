Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :users, only: :create
  resources :sessions, only: :create
  resources :tasks, except: %i[edit new]
  resource :bulk_tasks, except: %i[index create show edit new]
end
