class Admin::SiderTypesController < Admin::IndexController
  def index
    @list_of_all_helpers = SiderType.list_of_all_helpers
  end
  
  def create
    st = SiderType.create :sider_helper_module => params[:sider_helper_module]
    flash[:errors] = st.errors
    redirect_to admin_sider_types_path
  end
  
  def update
    st = SiderType.find params[:id]
    st.update_attribute "enabled",!st.enabled
    flash[:errors] = st.errors
    redirect_to admin_sider_types_path
  end
  
  def destroy
    SiderType.find(params[:id]).destroy
    redirect_to admin_sider_types_path
  end
end
