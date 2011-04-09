class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_access
  
  def after_sign_in_path_for(resource_or_scope)
    if params[:admin_zone]
      admin_root_url
    else
      super
    end
  end
  
  def after_sign_out_path_for(resource_or_scope)
    if params[:admin_zone]
      admin_root_url
    else
      super
    end
  end
  
  private
  
  def check_access
    @access_level = current_user ? current_user.access_level : 0
  end
end
