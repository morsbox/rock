class Sider < ActiveRecord::Base
  belongs_to :sider_type
  validates_presence_of :title, :sider_position
end
