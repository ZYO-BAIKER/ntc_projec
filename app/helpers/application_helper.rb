module ApplicationHelper
  def header_link(options = {})
    unless options[:condition]
      content_tag :li do
        link_to options[:label], options[:path],
                options[:link_options].merge({ class: "fas #{options[:icon]} text-decoration-none #{options[:link_class]}" })
      end
    end
  end
end
