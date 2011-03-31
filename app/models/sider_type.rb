class SiderType < ActiveRecord::Base
  has_many :siders
  validates_presence_of :helper_name
  before_save :make_dumps
  attr_accessor :default_params
  
  def after_find
    self.default_params = Marshal.load(default_params_dump)
  end
  
  def make_dumps
    self.default_params_dump = Marshal.dump(default_params)
  end
end
