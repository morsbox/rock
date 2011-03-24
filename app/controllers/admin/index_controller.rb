class Admin::IndexController < ApplicationController
  layout 'admin'
  
  def index
    render :sign_in unless current_user and current_user.access_level>=50
  end
end
