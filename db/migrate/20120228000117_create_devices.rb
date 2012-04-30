class CreateDevices < ActiveRecord::Migration
  def change
    create_table :bt_devices do |t|
      t.string :name

      t.timestamps
    end
  end
end
