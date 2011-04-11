class Sider < ActiveRecord::Base
  belongs_to :sider_type
  validates_presence_of :title, :sider_position
  before_save :make_dumps
  attr_accessor :params, :restrictions
  after_find :load_dumps
  
  def load_dumps
    self.params = Marshal.load(params_dump)
    self.restrictions = Marshal.load(restrictions_dump)
  end
  
  def make_dumps
    self.params_dump = Marshal.dump(params||{})
    self.restrictions_dump = Marshal.dump(restrictions||{})
  end

  def output_params
    return {} if new_record?
    # title and position is parameters for helper too
    output_params = params.merge :title => title, :sider_position => sider_position
    # if some parameters not asigned, use defaults
    sider_type.helper.default_params.each{ |key, value| output_params[key] ||= value[:value] }
    # sider output params hash
    output_params
  end
end
