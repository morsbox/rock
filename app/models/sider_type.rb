class SiderType < ActiveRecord::Base
  has_many :siders
  validates_presence_of :sider_helper_module
  attr_accessor :default_params
  after_find :load_params
  
  def self.list_of_all_helpers
    SiderHelpers.constants.map{ |sh|
      to_helper_module(sh).class==Module ? sh.to_s : nil
    }.compact
  end
  
  def self.to_helper_module(name)
    eval "SiderHelpers::"+name.to_s
  rescue
    nil
  end
  
  def load_params
    self.default_params = {}
  end
end
