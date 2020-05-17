Rails.application.routes.draw do
  devise_for :staff_members
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
