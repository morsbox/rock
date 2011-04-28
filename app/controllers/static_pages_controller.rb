class StaticPagesController < ApplicationController
  def index
    @current_pages = StaticPage.where("order_on_main > 0").order("order_on_main")
    render :show
  end
  
  def show
    @current_pages = StaticPage.where(:url_match => params[:url_match])
    render :text=>t.static_page.no_matches(params[:url_match]) if @current_pages.empty?
  end
end
