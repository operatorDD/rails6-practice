class Admins::TopController < ApplicationController
  def index
    if current_admin
      render action: 'dashboard'
    else
      render action: 'index'
    end
  end
end
