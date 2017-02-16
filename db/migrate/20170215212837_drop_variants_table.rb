class DropVariantsTable < ActiveRecord::Migration
  def up
    drop_table :variants
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
