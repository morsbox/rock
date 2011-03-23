module ApplicationHelper
  def sider(sider_name)
    raw "<div class='#{sider_name}'>Content of #{sider_name}</div>"
  end
end
