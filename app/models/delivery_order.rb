class DeliveryOrder < ApplicationRecord
  validates_presence_of :order_id, :serving_datetime
  has_many :order_item

  has_one :feedback, as: :ratable
  # has_many :feedback, as: :ratable, through: :order_item
  has_many :meal, through: :order_item

  def self.all_infor
    all_delivery_orders_infor = DeliveryOrder.all.map do |delivery_order|
      all_order_items = delivery_order.order_item
      order_items = all_order_items.map do |item|
        {
          order_item_id: item.id,
          name: item.meal.name
        }
      end

      {
        id: delivery_order.id,
        order_id: delivery_order.order_id,
        delivery_date: delivery_order.serving_datetime.to_date,
        delivery_time:  delivery_order.delivery_time( delivery_order.serving_datetime),
        feedback_submitted: delivery_order.feedback_submitted,
        order_items: order_items
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
      delivery_time: self.delivery_time(self.serving_datetime),
      order_items: order_items
    }
  end

  def delivery_time(date_time)
    delivery_period_lower_bound = date_time.strftime("%I:%M")
    delivery_period_upper_bound = (date_time + 30.minutes).strftime("%I:%M%p")
    return "#{delivery_period_lower_bound}" + "-" + "#{delivery_period_upper_bound}"
  end

  def show_feedback
    delivery_feedback = self.feedback
    all_order_items = self.order_item
    order_items_feedbacks = all_order_items.map do |order_item|
      feedback = order_item.feedback
      feedback.show_infor
    end
    order_items_feedbacks.unshift(delivery_feedback.show_infor)
    return order_items_feedbacks
  end
end
