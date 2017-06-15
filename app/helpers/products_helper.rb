module ProductsHelper

  def next_product_link(action, product_id)
    if action === "show"
      link_to "Next Product", "#", class: "next-product", data: { id: product_id, limit: product_count }
    end
  end

  def product_count
    return Product.all.size
  end


# <a href="#" class="next-product" data-id=params["id"]>Next Product</a>
end
