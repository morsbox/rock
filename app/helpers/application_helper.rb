module ApplicationHelper
  def sider(sider_position)
    siders = Sider.where(:sider_position => sider_position, :enabled => true).where(["access_level<=?",@access_level]).order(:display_order).includes(:sider_type)
    output = ""
    siders.each do |sider|
      output+=sider.output
    end
    raw output
  end
end
