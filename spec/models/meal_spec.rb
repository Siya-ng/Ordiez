require 'rails_helper'

RSpec.describe Meal, type: :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.name = "Sushi"
    subject.description = "Oishii sushi. Nakami ha tamago"
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    expect(subject).to_not be_valid
  end

  it "is not valid without a description" do
    subject.name = "Sushi"
    expect(subject).to_not be_valid
  end

  describe "Associations" do
    it "has many order_item" do
      assc = described_class.reflect_on_association(:order_item)
      expect(assc.macro).to eq :has_many
    end
  end

end
