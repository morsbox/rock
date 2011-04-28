class Admin::PageCategoriesController < Admin::IndexController
  def index
    @categories_graph, @categories = {},{}
    PageCategory.all.each do |c|
      @categories_graph.merge! c.id => c.parent_category_id
      @categories.merge! c.id => c
    end
  end
  
  def create
    pc = PageCategory.create params[:page_category]
    flash[:errors] = pc.errors
    redirect_to admin_page_categories_path
  end
  
  def update
    pc = PageCategory.find(params[:id]).update_attributes params[:page_category]
    flash[:errors] = pc.errors
    redirect_to admin_page_categories_path
  end
  
  def destroy
    PageCategory.find(params[:id]).destroy
    redirect_to admin_page_categories_path
  end
end
