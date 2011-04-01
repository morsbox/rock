class SiderType < ActiveRecord::Base
  has_many :siders
  validates_presence_of :sider_helper_module
  attr_accessor :default_params
  
  def after_find
    self.default_params = {}
  end
end
