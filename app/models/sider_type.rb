class SiderType < ActiveRecord::Base
  has_many :siders, :dependent => :destroy
  validates_presence_of :sider_helper_module
  attr_accessor :default_params
  after_find :load_params
  
  # this class method returns hash wIA like
  # :name => {:module => <SiderHelpers::SiderHelper>, :model => <InstanceOfSiderType>}
  def self.list_of_all_helpers
    list = HashWithIndifferentAccess.new{{}}
    SiderHelpers.constants.each do |sh|
      sh_module = to_helper_module(sh)
      list[sh] = {:module => sh_module} if sh_module.class==Module
    end
    all.each do |st|
      # Hash#merge! not works in this case properly..
      list[st.sider_helper_module] = list[st.sider_helper_module].merge :model => st
    end
    list
  end
  
  # returns sider helper module by simple name or nil if it's not present
  def self.to_helper_module(name)
    eval "SiderHelpers::"+name.to_s
  rescue
    nil
  end
  
  def load_params
    self.default_params = {}
  end
end
