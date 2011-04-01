class Admin::SiderTypesController < Admin::IndexController
  def index
    @list_of_all_helpers = SiderType.list_of_all_helpers
  end
  
  def create
    redirect_to :admin_sider_types_path
  end
  
  def update
    redirect_to :admin_sider_types_path
  end
  
  def destroy
    redirect_to :admin_sider_types_path
  end
end
