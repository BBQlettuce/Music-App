module ApplicationHelper
  def render_auth_token
    html = <<-HTML.html_safe
      <input
        type="hidden"
        name="authenticity_token"
        value ="#{form_authenticity_token}">
    HTML
    html
  end

end
