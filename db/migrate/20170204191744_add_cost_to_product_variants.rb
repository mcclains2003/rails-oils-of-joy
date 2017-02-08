class AddCostToProductVariants < ActiveRecord::Migration
  def change
    add_column :product_variants, :price, :decimal, :precision =>8, :scale => 2
  end
end
