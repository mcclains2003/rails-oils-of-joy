class CreateOils < ActiveRecord::Migration
  def change
    create_table :oils do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
