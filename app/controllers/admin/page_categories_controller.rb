class Admin::PageCategoriesController < Admin::IndexController
  def index
    @categories_graph, @categories = {},{}
    PageCategory.all.each do |c|
      @categories_graph.merge! c.id => c.parent_category_id
      @categories.merge! c.id => c
    end
  end
  
  def create
    redirect_to admin_page_categories_path
  end
  
  def update
    redirect_to admin_page_categories_path
  end
  
  def destroy
    redirect_to admin_page_categories_path
  end
end
