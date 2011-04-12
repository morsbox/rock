module Admin::PageCategoriesHelper
  def draw_graph parent_category=nil, level = 0
    result = parent_category ? "<div style='padding-left:#{level*10}px'>#{@categories[parent_category].title}</div>" : ""
    @categories_graph.each{ |k,v| result+= draw_graph(k, level+1) if v==parent_category}
    result
  end
end
