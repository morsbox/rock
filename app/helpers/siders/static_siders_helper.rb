module Siders::StaticSidersHelper
  def self.description
    "This sider used for simple display of HTML code"
  end
  def self.default_params
    { :content => {:type => 'text', :cols => 35, :rows => 15, :value => ''},
      :sider_id => {:type => 'string', :value => ''},
      :show_title => {:type => 'check', :value => '1'}}
  end
  
  def self.output_method
    :static_siders_output
  end
end

module ApplicationHelper
  def static_siders_output(p)
    title = "<h3>#{p[:title]}</h3>" if p[:show_title]=='1'
    sider_id = " id='#{p[:sider_id]}'" unless p[:sider_id].blank?
    <<-HTML
      <div#{sider_id} class='sider_#{p[:sider_position]}'>
      #{title}
      <div>#{p[:content]}</div>
      </div>
    HTML
  end
end
