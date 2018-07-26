Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :tasks, except: %i[edit new]
end
