class CreateBatteries < ActiveRecord::Migration
  def change
    create_table :bt_batteries do |t|
      t.decimal :capacity, :precision => 10, :scale => 6
      t.string :name
      t.integer :device_id

      t.timestamps
    end
  end
end
