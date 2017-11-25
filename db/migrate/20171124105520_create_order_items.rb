class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.references :delivery_order, foreign_key: true
      t.references :meal, foreign_key: true
      t.integer "quantity", null: false, default: 0
      t.integer "unit_price", null: false, default: 0

      t.timestamps
    end
  end
end
