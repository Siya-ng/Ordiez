class OrdersController < ApplicationController

  def index
    @all_delivery_orders_infor = DeliveryOrder.all_infor
    render json: { orders: @all_delivery_orders_infor }
  end

  def show
    order_id = params[:order_id]

    delivery_order = DeliveryOrder.find_by(order_id: order_id)
    @delivery_order_infor = { order: delivery_order.show_infor }
    render json: @delivery_order_infor

  end

end
