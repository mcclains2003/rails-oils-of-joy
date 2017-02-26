module NavigationHelper

  def link_helper(link_title, path, class_name)
    link_to link_title, path, class: class_name
  end

  def all_categories
    @categories ||= Category.all
  end

  def product_category_index_dropdown
    content_tag(:div, :class => 'dropdown-menu') do 
      all_categories.collect do |category|
        content_tag(:a, category.name, {class: 'dropdown-item', href: "/categories/#{ category.id }/products"})
      end.join.html_safe
    end
  end

  def authentication_nav_link(name, path, method = :get)
    content_tag(:li, class: 'nav-item') do 
      link_to name, path, method: method, class: 'nav-link'
    end
  end

  def authentication_nav_text(user)
    content_tag(:li, "Hello, #{ user.name }", class: 'nav-text') do 
      "Hello, #{ user.name }"
    end
  end

end