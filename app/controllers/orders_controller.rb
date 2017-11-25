class OrdersController < ApplicationController

  def index
    # all_delivery_orders = DeliveryOrder.all
    # @all_delivery_orders_infor = all_delivery_orders.map do |delivery_order|
    #   {
    #     order_id: delivery_order.order_id,
    #     delivery_date: delivery_order.serving_datetime.to_date,
    #     delivery_time: delivery_order.serving_datetime.strftime("%I:%M%p")
    #   }
    # end
    @all_delivery_orders_infor = DeliveryOrder.all_infor
    render json: { orders: @all_delivery_orders_infor }
  end

  def show
    order_id = params[:order_id]

    delivery_order = DeliveryOrder.find_by(order_id: order_id)
    @delivery_order_infor = { order: delivery_order.show_infor }
    render json: @delivery_order_infor


    # render json: @delivery_order, include: 'order_item'
  end

end
