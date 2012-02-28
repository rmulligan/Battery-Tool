class CreateDeviceStates < ActiveRecord::Migration
  def change
    create_table :device_states do |t|
      t.integer :device_id
      t.string :state
      t.float :current_draw

      t.timestamps
    end
  end
end
