class Admin::SidersController < Admin::IndexController
  def index
    @siders = Sider.includes(:sider_type)
  end
  
  def new
    if params[:sider_type_id] and @sider_type = SiderType.where(:id => params[:sider_type_id] ).first
      @sider = @sider_type.siders.build flash[:sider]
      @sider.params = flash[:params]
      @sider_helper_params = @sider_type.helper.default_params
      @sider_params = @sider.output_params
    else
      @sider_types = SiderType.where :enabled => true
      render "select_sider_type"
    end
  end
  
  def create
    @sider = Sider.create params[:sider]
    @sider.params = params[:params]
    if @sider.save
      redirect_to admin_siders_path
    else
      flash[:sider] = params[:sider]
      flash[:params] = params[:params]
      flash[:errors] = @sider.errors
      redirect_to new_admin_sider_path(:sider_type_id=>params[:sider][:sider_type_id])
    end 
  end
  
  def edit
    @sider = Sider.find params[:id]
    @sider_helper_params = @sider.sider_type.helper.default_params
    @sider_params = @sider.output_params
  end
  
  def update
    @sider = Sider.find(params[:id])
    @sider.params = params[:params]
    if @sider.update_attributes(params[:sider])
      redirect_to admin_siders_path
    else
      flash[:errors] = @sider.errors
      redirect_to edit_admin_sider_path(@sider)
    end 
  end
  
  def destroy
    @sider = Sider.find(params[:id])
    @sider.destroy
    redirect_to admin_siders_path
  end
end
