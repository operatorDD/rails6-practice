Rails.application.routes.draw do
  # devise_for :staff
  devise_for :staffs, path: 'staffs', controllers: { sessions: 'staffs/sessions' }
  devise_for :admins

  namespace :staffs do
    root 'top#index'
    
  end

  namespace :admins do
    root 'top#index'
  end

  namespace :customers do
    root 'top#index'
  end
end
