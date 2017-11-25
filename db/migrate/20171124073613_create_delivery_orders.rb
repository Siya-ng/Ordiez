class CreateDeliveryOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :delivery_orders do |t|

      t.string "order_id", null: false
      t.datetime "serving_datetime", null: false, default: DateTime.now

      t.timestamps
    end
  end
end
