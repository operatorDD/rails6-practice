Rails.application.routes.draw do
  config = Rails.application.config.baukis2
  devise_for :staffs, path: 'staffs', controllers: { sessions: 'staffs/sessions' }
  devise_for :admins, path: 'admins', controllers: { sessions: 'admins/sessions' }

  constraints host: config[:staffs][:host] do
    namespace :staffs, path: config[:staffs][:path] do
      root 'top#index'
      resource :account, except: %i[new create destroy]
    end
  end

  constraints host: config[:admins][:host] do
    namespace :admins, path: config[:admins][:path] do
      root 'top#index'
      resources :staffs
    end
  end

  namespace :customers do
    root 'top#index'
  end
end
