module NavigationHelper

  def link_helper(link_title, path, class_name)
    link_to link_title, path, class: class_name
  end

  def all_categories
    @categories ||= Category.all
  end

end