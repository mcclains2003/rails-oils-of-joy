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
        classTitle = category.name.parameterize('_')

        content_tag(:a, category.name, {class: "product dropdown-item", href: "/categories/#{ category.id }/products", id: category.id})
      end.join.html_safe
    end
  end

  def nav_link_helper(name, path, method = :get)
    content_tag(:li, class: 'nav-item') do 
      link_to name, path, method: method, class: 'nav-link', id: name.underscore
    end
  end

  def nav_text_helper(user)
    content_tag(:li, "Hello, #{ user.name }", class: 'nav-link') do 
      "Hello, #{ user.name }"
    end
  end

  def authentication_items
    content_tag(:ul, class: "nav navbar-nav navbar-right col-md-auto") do 
      if current_user
        link1 = nav_text_helper(current_user)
        link2 = nav_link_helper("Log Out", logout_path, :delete)
      else
        link1 = nav_link_helper("Sign Up", new_user_path)
        link2 = nav_link_helper("Login", login_path)
      end
      (link1 + link2).html_safe
    end
  end

end