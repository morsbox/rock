module Admin::PageCategoriesHelper
  def draw_graph parent_category=nil, level = 0
    result = ""
    if parent_category
      result+="<div style='padding-left:#{level*10}px'>"
      result+= form_for [:admin, @categories[parent_category]] do |f|
        concat f.text_field :title
        concat f.select :parent_category_id, @options_tree
        concat f.submit
        concat link_to t.delete, admin_page_category_path(@categories[parent_category]), :method => :delete, :confirm => "Are you sure?"
      end
      result+="</div>"
    end
    @categories_graph.each{ |k,v| result+= draw_graph(k, level+1) if v==parent_category}
    result
  end
  
  # return array of pairs [title,id] recursive
  def draw_options_tree parent_category=nil, level = 0
    result = []
    result << ["_"*level+@categories[parent_category].title, parent_category] if parent_category
    @categories_graph.each{ |k,v| result+= draw_options_tree k, level+1 if v==parent_category}
    result
  end
end
