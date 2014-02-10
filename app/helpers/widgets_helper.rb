module WidgetsHelper

  def widgets slot, style
    output = []
    output << "<div class='slot #{slot}'>"
    @page.widgets.where(slot: slot).order(:sort).each do |widget|
      @widget = widget
      @resource = widget.resource
      instance_variable_set("@#{@resource.class.to_s.underscore}", @resource)
      @map = widget.resource
      file = [widget.resource_type.underscore.pluralize, "widgets", style].join('/')
      output << "<div class='widget #{style}_widget'>"
      output << render(file: file)
      output << "</div>"
    end
    output << render(partial: 'widgets/widget_selection')
    output << "</div>"
    return output.join.html_safe
  end
end
