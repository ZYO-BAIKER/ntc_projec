module ApplicationHelper
  def header_link(label, path, icon, condition = nil, options = {})
    unless condition
      content_tag :li do
        link_to label, path, options.merge({ class: "fas #{icon} text-decoration-none link-dark" })
      end
    end
  end
end
