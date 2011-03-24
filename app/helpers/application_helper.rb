module ApplicationHelper
  def sider(sider_position)
    raw "<div class='sider_#{sider_position}'>Content of #{sider_position}</div>"
  end
end
