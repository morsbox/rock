module SiderHelpers
  module StaticSider
    def self.description
      "This sider used for simple display of HTML code"
    end
    def self.default_params
      { :content => {:type => 'text', :value => ''},
        :show_title => {:type => 'check', :value => true}}
    end
  end
end
