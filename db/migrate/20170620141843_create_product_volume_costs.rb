class CreateProductVolumeCosts < ActiveRecord::Migration
  def change
    create_table :product_volume_costs do |t|
      t.integer :product_id
      t.integer :volume_cost_id

      t.timestamps null: false
    end
  end
end
