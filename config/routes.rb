Rails.application.routes.draw do
  # devise_for :staff
  devise_for :staff, path: 'staffs', controllers: { sessions: 'staff/sessions' }
  devise_for :admin

  namespace :staff do
    root 'top#index'
    
  end

  namespace :admin do
    root 'top#index'
  end

  namespace :customer do
    root 'top#index'
  end
end
