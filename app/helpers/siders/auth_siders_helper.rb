module Siders::AuthSidersHelper
  def self.description
    "This sider used for display login/logout form"
  end
  def self.default_params
    { :show_title => {:type => 'check', :value => '1'},
      :greeting_msg => {:type => 'string', :value => 'Hello!'}}
  end
  
  def self.output_method
    :auth_siders_output
  end
end

module ApplicationHelper
  def auth_siders_output(p)
    title = "<h3 class='auth_title'>#{p[:title]}</h3>" if p[:show_title]=='1'
    if user_signed_in?
      form = "<p>#{p[:greeting_msg]}</p>"
      form+= link_to "Sign out, #{current_user.username}", destroy_user_session_path
    else
      form = capture{form_for("user", :url => user_session_path) do |f|
        concat f.text_field :username 
        concat f.password_field :password
        concat f.check_box :remember_me
        concat f.label :remember_me
        concat f.submit 'Sign in'
        link_to "Forgot your password?", new_password_path('user')
      end}
    end
    <<-HTML
      <div class='sider_#{p[:sider_position]}'>
      #{title}
      <div class='auth_title'>
      #{form}
      </div>
      </div>
    HTML
  end
end