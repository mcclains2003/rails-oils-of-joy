module CategoriesHelper

  def category_title(category)
    category.name.titleize.pluralize
  end

end
