require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :index ,format: :json
      expect(response.status).to eq(200)
    end

    it "contain correct individual information" do
      delivery_order = DeliveryOrder.all[0]
      get :index

      delivery_period_lower_bound = delivery_order.serving_datetime.strftime("%I:%M")
      delivery_period_upper_bound = (delivery_order.serving_datetime + 30.minutes).strftime("%I:%M%p")
      first_delivery_orders = {
        order_id: delivery_order.order_id,
        delivery_date: delivery_order.serving_datetime.to_date,
        delivery_time: "#{delivery_period_lower_bound}" + "-" + "#{delivery_period_upper_bound}"
      }

      response_body_result = JSON.parse(response.body)
      first_response_body_result = response_body_result["orders"][0]
      # convert both to json for comparsion
      json_first_response_body_result = first_response_body_result.to_json
      json_first_delivery_orders = first_delivery_orders.to_json

      expect(json_first_response_body_result).to eq(json_first_delivery_orders)
    end

    it "view all orders" do
      delivery_orders = DeliveryOrder.all
      get :index

      all_delivery_orders = delivery_orders.map do |delivery_order|
        delivery_period_lower_bound = delivery_order.serving_datetime.strftime("%I:%M")
        delivery_period_upper_bound = (delivery_order.serving_datetime + 30.minutes).strftime("%I:%M%p")
        {
          order_id: delivery_order.order_id,
          delivery_date: delivery_order.serving_datetime.to_date,
          delivery_time: "#{delivery_period_lower_bound}" + "-" + "#{delivery_period_upper_bound}"
        }
      end
      response.body.should == {orders: all_delivery_orders}.to_json
    end

  end
  describe "GET indiv" do

    it "has a 200 status code" do
      get :index ,format: :json
      expect(response.status).to eq(200)
    end

    it "should view individual orders" do

      order_id  = DeliveryOrder.all.sample.order_id

      delivery_order = DeliveryOrder.find_by(order_id: order_id)
      delivery_order_infor = { order: delivery_order.show_infor }
      
      get :show, params: { order_id: order_id  }

      response.body.should == delivery_order_infor.to_json
    end
  end

end
