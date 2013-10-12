module ApplicationHelper
  def body_class
    @body_class ||= "#{controller.controller_name.dasherize} #{controller.controller_name.dasherize}-#{controller.action_name.dasherize}"
  end

  def sprite_tag(name, opts={})
    image_tag "s.gif", opts.merge(:class => "#{opts[:class]} #{name}", :alt => (opts[:alt] || ""))
  end

  def markdown(str)
    RDiscount.new(str).to_html.html_safe unless str.nil?
  end

  def open_graph_tags
    return unless @open_graph_tags.present?

    @open_graph_tags.map do |key, value|
      "<meta property='#{ERB::Util.html_escape(key)}' content='#{ERB::Util.html_escape(value)}'>"
    end.join.html_safe
  end
end
