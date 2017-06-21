class AddCategoryIdToVolumeCost < ActiveRecord::Migration
  def change
    add_column :volume_costs, :category_id, :integer
  end
end
