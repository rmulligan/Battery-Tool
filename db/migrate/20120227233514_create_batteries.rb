class CreateBatteries < ActiveRecord::Migration
  def change
    create_table :batteries do |t|
      t.float :capacity
      t.string :name
      t.integer :device_id

      t.timestamps
    end
  end
end
