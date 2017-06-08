module ProductsHelper

  def next_product_link(action, product_id)
    if action === "show"
      link_to "Next Product", "#", class: "next-product", data: { id: product_id }
    end
  end


# <a href="#" class="next-product" data-id=params["id"]>Next Product</a>
end
