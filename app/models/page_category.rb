class PageCategory < ActiveRecord::Base
  has_many  :child_categories, :class_name => "PageCategory",
            :foreign_key => "parent_category_id", :dependent => :nullify
  belongs_to :parent_category, :class_name => "PageCategory"
  has_many :static_pages, :dependent => :nullify
  
  validates_presence_of :title
  validate :no_loop
  
  def parent_categories
    pcs, c = Array.new, self
    until c.parent_category.nil?
      raise "Wrong hierarchy of categories." if pcs.index(c.parent_category)
      pcs << c=c.parent_category
      break if c==self
    end
    pcs
  end
  
  def no_loop
    errors[:base] << "Categories must be like tree. No loops, please." if parent_categories.index(self)
  end
  
end
