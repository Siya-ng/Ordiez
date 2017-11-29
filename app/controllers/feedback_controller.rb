class FeedbackController < ApplicationController

  def index
    order_id = params[:order_id]
    delivery_order = DeliveryOrder.find_by(order_id: order_id)
    feedbacks = delivery_order.show_feedback
    render json: {feedbacks: feedbacks}
  end
end
