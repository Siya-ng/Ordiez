class DeliveryOrder < ApplicationRecord
  validates_presence_of :order_id, :serving_datetime
  has_many :order_item

  has_many :meal, through: :order_item

  def printY
    print "y"
  end

  def self.all_infor
    all_delivery_orders_infor = DeliveryOrder.all.map do |delivery_order|
      {
        order_id: delivery_order.order_id,
        delivery_date: delivery_order.serving_datetime.to_date,
        delivery_time: delivery_order.serving_datetime.strftime("%I:%M%p")
      }
    end
    return all_delivery_orders_infor
  end


  def show_infor
    all_order_items = self.order_item
    order_items = all_order_items.map do |item|
      {
        name: item.meal.name,
        quantity: item.quantity,
        total_price: item.unit_price * item.quantity
      }
    end
    return {
      order_id: self.order_id,
      delivery_date: self.serving_datetime.to_date,
      delivery_time: self.serving_datetime.strftime("%I:%M%p"),
      order_items: order_items
    }
  end

end
