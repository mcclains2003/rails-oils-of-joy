class AddOilIdToBenefits < ActiveRecord::Migration
  def change
    add_column :benefits, :oil_id, :integer
  end
end
