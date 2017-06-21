class RemoveProductIdFromVolumeCosts < ActiveRecord::Migration
  def change
    remove_column :volume_costs, :product_id
  end
end
