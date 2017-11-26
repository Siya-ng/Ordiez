require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :index ,format: :json
      expect(response.status).to eq(200)
    end

    it "contain correct inforation" do
      delivery_order = DeliveryOrder.all[0]
      get :index

      first_delivery_orders = {
        order_id: delivery_order.order_id,
        delivery_date: delivery_order.serving_datetime.to_date,
        delivery_time: delivery_order.serving_datetime.strftime("%I:%M%p")
      }

      response_body_result = JSON.parse(response.body)
      first_response_body_result = response_body_result["orders"][0]
      json_first_response_body_result = first_response_body_result.to_json
      json_first_delivery_orders = first_delivery_orders.to_json

      expect(json_first_response_body_result).to eq(json_first_delivery_orders)
    end

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

    it "has a 200 status code" do
      get :index ,format: :json
      expect(response.status).to eq(200)
    end

    it "contain correct inforation" do
      order_id  = DeliveryOrder.all.sample.order_id
      delivery_order = DeliveryOrder.find_by(order_id: order_id).show_infor

      get :show, params: { order_id: order_id  }
    
      response_body_result = JSON.parse(response.body)["order"]
      # to get the same date format
      modify_delivery_order = JSON.parse(delivery_order.to_json)

      expect(response_body_result["order_id"]).to eq(modify_delivery_order["order_id"])
      expect(response_body_result["delivery_date"]).to eq(modify_delivery_order["delivery_date"])
      expect(response_body_result["delivery_time"]).to eq(modify_delivery_order["delivery_time"])
      expect(response_body_result["order_items"]).to eq(modify_delivery_order["order_items"])
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
