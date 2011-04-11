module ApplicationHelper
  def sider(sider_position)
    siders = Sider.joins(:sider_type).where(:sider_position => sider_position, :enabled => true, "sider_types.enabled" => true).where(["access_level<=?",@access_level]).order(:display_order)
    result = ""
    siders.each do |sider|
      result+=try sider.sider_type.helper.output_method, sider.output_params
    end
    raw result
  end
end
