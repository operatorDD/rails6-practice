Rails.application.routes.draw do
  devise_for :staffs, path: 'staffs', controllers: { sessions: 'staffs/sessions' }
  devise_for :admins, path: 'admins', controllers: { sessions: 'admins/sessions' }

  namespace :staffs do
    root 'top#index'
    resource :account, except: %i[new create destroy]
  end

  namespace :admins do
    root 'top#index'
    resources :staffs
  end

  namespace :customers do
    root 'top#index'
  end
end
