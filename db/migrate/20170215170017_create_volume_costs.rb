class CreateVolumeCosts < ActiveRecord::Migration
  def change
    create_table :volume_costs do |t|
      t.integer :product_id
      t.decimal :volume, :default => 0, :precision => 10, :scale => 2
      t.decimal :cost, :default => 0, :precision => 10, :scale => 2

      t.timestamps null: false
    end
  end
end
