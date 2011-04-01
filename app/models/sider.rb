class Sider < ActiveRecord::Base
  belongs_to :sider_type
  validates_presence_of :title, :sider_position
  before_save :make_dumps
  attr_accessor :params, restrictions
  after_find :load_dumps
  
  def load_dumps
    self.params = Marshal.load(params_dump)
    self.restrictions = Marshal.load(restrictions_dump)
  end
  
  def make_dumps
    self.params_dump = Marshal.dump(params)
    self.restrictions_dump = Marshal.dump(restrictions)
  end
end
