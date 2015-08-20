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

  # def generate_radio_buttons(param, appearance, model, options)
  #   html_string = "<label for='#{param}'>#{appearance}</label>"
  #   options.each do |option|
  #     button = <<-HTML
  #       <input id="#{param}"
  #         type="radio"
  #         name="#{model}[#{param}]"
  #         value="#{option}"
  #
  #     HTML
  # end
end
