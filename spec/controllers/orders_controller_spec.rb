require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe "GET index" do
    it "view all orders" do
      delivery_orders = DeliveryOrder.all
      get :index

      all_delivery_orders = delivery_orders.map do |delivery_order|
        {
          order_id: delivery_order.order_id,
          delivery_date: delivery_order.serving_datetime.to_date,
          delivery_time: delivery_order.serving_datetime.strftime("%I:%M%p")
        }
      end
      response.body.should == {orders: all_delivery_orders}.to_json
    end

  end
  describe "GET indiv" do

    it "should view individual orders" do

      order_id  = DeliveryOrder.all.sample.order_id

      delivery_order = DeliveryOrder.find_by(order_id: order_id)
      delivery_order_infor = { order: delivery_order.show_infor }

      # params = { order_id: order_id }
      get :show, params: { order_id: order_id  }


      response.body.should == delivery_order_infor.to_json
    end

    # it "view all orders" do
    #   delivery_order = DeliveryOrder.all
    #   get :index
    #   expect(assigns())
    # end

    # it "renders the index template" do
    #   get :index
    #   expect(response).to render_template("index")
    # end

  end

end
