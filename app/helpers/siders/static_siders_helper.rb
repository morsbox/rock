module Siders::StaticSidersHelper
  def self.description
    "This sider used for simple display of HTML code"
  end
  def self.default_params
    { :content => {:type => 'text', :value => ''},
      :show_title => {:type => 'check', :value => true}}
  end
  
  def self.output_method
    :static_siders_output
  end
end

module ApplicationHelper
  def static_siders_output(p)
    title = "<h3>#{p[:title]}</h3>" if p[:show_title]
    <<-HTML
      <div class='sider_#{p[:sider_position]}'>
      #{title}
      Content of #{p[:title]}
      </div>
    HTML
    debug p
    user_session_path
  end
end
