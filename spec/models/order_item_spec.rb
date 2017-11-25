require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.delivery_order_id = DeliveryOrder.all.sample.id
    subject.meal_id = Meal.all.sample.id
    subject.quantity = 2
    subject.unit_price = 2990
    expect(subject).to be_valid
  end

  it "is not valid without a delivery_order" do
    expect(subject).to_not be_valid
  end

  it "is not valid without a meal" do
    subject.delivery_order_id = DeliveryOrder.all.sample.id
    expect(subject).to_not be_valid
  end

  it "is not valid without a quantity" do
    subject.delivery_order_id = DeliveryOrder.all.sample.id
    subject.meal_id = Meal.all.sample.id
    expect(subject).to_not be_valid
  end

  it "is not valid without a unit_price" do
    subject.delivery_order_id = DeliveryOrder.all.sample.id
    subject.meal_id = Meal.all.sample.id
    subject.quantity = 2
    expect(subject).to_not be_valid
  end
end
