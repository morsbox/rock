class StaticPage < ActiveRecord::Base
  belongs_to :page_category
  
  validates_presence_of :title
end
