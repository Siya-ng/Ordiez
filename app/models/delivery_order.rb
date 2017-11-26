class DeliveryOrder < ApplicationRecord
  validates_presence_of :order_id, :serving_datetime
  has_many :order_item

  has_many :meal, through: :order_item

  def self.all_infor
    all_delivery_orders_infor = DeliveryOrder.all.map do |delivery_order|

      delivery_period_lower_bound = delivery_order.serving_datetime.strftime("%I:%M")
      delivery_period_upper_bound = (delivery_order.serving_datetime + 30.minutes).strftime("%I:%M%p")
      {
        order_id: delivery_order.order_id,
        delivery_date: delivery_order.serving_datetime.to_date,
        delivery_time: "#{delivery_period_lower_bound}" + "-" + "#{delivery_period_upper_bound}"
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
    delivery_period_lower_bound = self.serving_datetime.strftime("%I:%M")
    delivery_period_upper_bound = (self.serving_datetime + 30.minutes).strftime("%I:%M%p")
    
    return {
      order_id: self.order_id,
      delivery_date: self.serving_datetime.to_date,
      delivery_time: "#{delivery_period_lower_bound}" + "-" + "#{delivery_period_upper_bound}",
      order_items: order_items
    }
  end

end
