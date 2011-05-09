class Admin::StaticPagesController < Admin::IndexController
  before_filter :load_categories_graph, :only => [:new, :edit]
  
  def index
    @static_pages = StaticPage.all
  end
  
  def new
    @static_page = StaticPage.create flash[:static_page]
  end
  
  def create
    @static_page = StaticPage.create params[:static_page]
    if @static_page.save
      redirect_to admin_static_pages_path
    else
      flash[:static_page] = params[:static_page]
      flash[:errors] = @static_page.errors
      redirect_to new_admin_static_page_path
    end 
  end
  
  def edit
    @static_page = StaticPage.find params[:id]
  end
  
  def update
    @static_page = StaticPage.find params[:id]
    if @static_page.update_attributes(params[:static_page])
      redirect_to admin_static_pages_path
    else
      flash[:errors] = @static_page.errors
      redirect_to edit_admin_static_page_path(@static_page)
    end 
  end
  
  def destroy
    StaticPage.find(params[:id]).destroy
    redirect_to admin_static_pages_path
  end

private

  def load_categories_graph
    @categories_graph, @categories = {},{}
    PageCategory.all.each do |c|
      @categories_graph.merge! c.id => c.parent_category_id
      @categories.merge! c.id => c
    end
  end
  
end
