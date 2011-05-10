class StaticPage < ActiveRecord::Base
  include R18n::Translated
  
  belongs_to :author, :class_name=>"User"
  belongs_to :page_category
  
  validates_presence_of :title
  #TODO validates :url_match
  
  def link locale=nil
    locale ||= I18n.locale
    prefix = locale==I18n.default_locale ? "" : "/#{locale.to_s}"
    prefix + "/" + url_match
  end
end
