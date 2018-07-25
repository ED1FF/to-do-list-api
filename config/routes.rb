Rails.application.routes.draw do
  resources :tasks, except: %i[edit new]
end
