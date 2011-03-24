class Admin::IndexController < ApplicationController
  layout 'admin'
  before_filter :check_admin
  
  def index
  end
  
  private
  def check_admin
    render 'admin/index/sign_in' unless current_user and current_user.access_level>=50
  end
end
