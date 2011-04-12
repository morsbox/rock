class StaticPage < ActiveRecord::Base
  belongs_to :author, :class_name=>"User"
  belongs_to :page_category
  
  validates_presence_of :title
end
