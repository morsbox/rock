module Siders::AuthSidersHelper
  def self.description
    "This sider used for display login/logout form"
  end
  def self.default_params
    { :show_title => {:type => 'check', :value => '1'},
      :greeting_msg => {:type => 'string', :value => 'Hello, #{current_user.username}'}}
  end
  
  def self.output_method
    :auth_siders_output
  end
end

module ApplicationHelper
  def auth_siders_output(p)
    "<div class='sider_#{p[:sider_position]}'>Content of #{p[:title]}</div>"
  end
end