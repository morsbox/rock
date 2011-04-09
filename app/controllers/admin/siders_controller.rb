class Admin::SidersController < Admin::IndexController
  def index
    @siders = Sider.includes(:sider_type)
  end
  
  def new
    if params[:sider_type_id] and @sider_type = SiderType.where(:id => params[:sider_type_id] ).first
      @sider = @sider_type.siders.build
    else
      @sider_types = SiderType.where :enabled => true
      render "select_sider_type"
    end
  end
  
  def create
    @sider = Sider.create params[:sider]
    if @sider.save
      redirect_to admin_siders_path
    else
      redirect_to new_admin_sider_path(:sider_type_id=>params[:sider_type_id])
    end 
  end
  
  def edit
    @sider = Sider.find params[:id]
  end
  
  def update
    @sider = Sider.find(params[:id])
    if @sider.update_attributes(params[:sider])
      redirect_to admin_siders_path
    else
      redirect_to edit_admin_sider_path(@sider)
    end 
  end
  
  def destroy
    @sider = Sider.find(params[:id])
    @sider.destroy
    redirect_to admin_siders_path
  end
end
