module ApplicationHelper
  def image_preview(f)
    url, style =  f.object.image.present? ?  [f.object.image.url(:thumb), ''] : ['#','display:none;']
    content_tag(:div, nil) do
      concat image_tag url , {id: 'img_prev', style: style}
      concat ''.html_safe
      concat  f.button 'Remove', {type: 'button', class: 'remove_image', style:'display:none;'}
    end
  end
end
