class Admin::SidersController < Admin::IndexController
  def index
  end
  
  def new
  end
  
  def create
    sider = Sider.create params[:sider]
    redirect_to edit_admin_sider_path(sider)
  end
  
  def edit
  end
  
  def update
    redirect_to :back
  end
  
  def destroy
    redirect_to admin_siders_path
  end
end
