module Admin::SidersHelper
  def param_fields field_name
    result = label :params, field_name
    case @sider_helper_params[field_name][:type]
    when 'check'
      result+= check_box :params, field_name, :checked => (@sider_params[field_name]||@sider_helper_params[field_name][:value])=="1"
    when 'string'
      result+= text_field :params, field_name, :value => @sider_params[field_name]||@sider_helper_params[field_name][:value]
    when 'text'
      result+= text_area :params, field_name, :value => @sider_params[field_name]||@sider_helper_params[field_name][:value], :cols => @sider_helper_params[field_name][:cols]||40, :rows => @sider_helper_params[field_name][:rows]||10
    else
      result+= raw '<span class="right_column">No input for this params type!</span>'
    end
    result
  end
end
