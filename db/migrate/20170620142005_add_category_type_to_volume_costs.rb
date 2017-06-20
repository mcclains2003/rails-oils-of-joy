class AddCategoryTypeToVolumeCosts < ActiveRecord::Migration
  def change
    add_column :volume_costs, :category_type, :string
  end
end
