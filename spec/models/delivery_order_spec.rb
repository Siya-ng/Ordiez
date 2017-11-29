require 'rails_helper'

RSpec.describe DeliveryOrder, type: :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.order_id = "G0010"
    subject.serving_datetime = DateTime.now
    expect(subject).to be_valid
  end

  it "is not valid without a order_id" do
    expect(subject).to_not be_valid
  end

  it "is not valid without a serving_datetime" do
    subject.order_id = "G0010"
    expect(subject).to_not be_valid
  end

  describe "Associations" do
    it "has many order_item" do
      assc = described_class.reflect_on_association(:order_item)
      expect(assc.macro).to eq :has_many
    end

    it "has many meal" do
      assc = described_class.reflect_on_association(:meal)
      expect(assc.macro).to eq :has_many
    end

    it "has one feedback" do
      assc = described_class.reflect_on_association(:feedback)
      expect(assc.macro).to eq :has_one
    end
  end

end
