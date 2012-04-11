class CreateBatteries < ActiveRecord::Migration
  def change
    create_table :batteries do |t|
      t.decimal :capacity, :precision => 10, :scale => 6
      t.string :name
      t.integer :device_id

      t.timestamps
    end
  end
end
