class Admin::SidersController < Admin::IndexController
  def index
    @siders = Sider.includes(:sider_type)
  end
  
  def new
    @sider_type = SiderType.where :id => params[:sider_type_id]
    if @sider_type.empty?
      @sider_types = SiderType.where :enabled => true
      render "select_sider_type"
    end
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
