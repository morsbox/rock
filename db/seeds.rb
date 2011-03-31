# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

if StaticPage.where(:url_match => "home").empty?
  StaticPage.create :title => "Welcome!",
                    :content => "<p>Welcome to the <strong>Rock'n'RoR!</strong></p>",
                    :order_on_main=>1, :url_match => "home"
end

if User.where(:username => "admin").empty?
  user = User.new  :email => "admin@domain.com", :username => "admin",
                   :password => "123456"
  user.access_level = 100
  user.save
end

if SiderType.where(:helper_name => "static_sider").empty?
  static_sider = SiderType.create :helper_name => "static_sider",
      :default_params => {:content => {:type => 'text', :value => ''},
                          :show_title => {:type => 'check', :value => true}}
end
