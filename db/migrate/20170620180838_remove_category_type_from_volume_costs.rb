class RemoveCategoryTypeFromVolumeCosts < ActiveRecord::Migration
  def change
    remove_column :volume_costs, :category_type
  end
end
