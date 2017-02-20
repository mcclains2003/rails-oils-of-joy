module NavigationHelper

  # def navigation_item(nav_name, nav_path)
  #   content_tag(:li, class: "nav-item") do
  #     content_tag(:a, class: "nav-link", href: "nav_path")
  #   end
  # end

  

end



    #   <li class="nav-item">
    #     <a class="nav-link" href="#">Features</a>
    #   </li>



    #   def sidebar_item(title, options = {}, &block)
    #   url = options.fetch(:url, '#')
    #   identifier = options.fetch(:identifier, url)

    #   content_tag(:li, class: class_for_sidebar_item(url, identifier, block.present?)) do
    #     link = link_to(url, options.fetch(:link_options, {})) do
    #       fa_icon(options[:icon], text: title)
    #     end

    #     if block.present?
    #       link + capture_haml(&block)
    #     else
    #       link
    #     end
    #   end
    # end