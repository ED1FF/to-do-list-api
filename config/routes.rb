Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :users, only: :create
  resources :tasks, except: %i[edit new]
end
