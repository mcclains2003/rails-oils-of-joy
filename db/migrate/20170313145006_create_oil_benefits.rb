class CreateOilBenefits < ActiveRecord::Migration
  def change
    create_table :oil_benefits do |t|
      t.integer :oil_id
      t.integer :benefit_id

      t.timestamps null: false
    end
  end
end
