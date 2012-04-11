class CreateDeviceStates < ActiveRecord::Migration
  def change
    create_table :device_states do |t|
      t.integer :device_id
      t.string :state
      t.decimal :current_draw, :precision => 10, :scale => 6

      t.timestamps
    end
  end
end
