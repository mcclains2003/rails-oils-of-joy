class DropProductVariantsTable < ActiveRecord::Migration
  def up
    drop_table :product_variants
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
