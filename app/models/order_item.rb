class OrderItem < ApplicationRecord
  validates_presence_of :quantity, :unit_price

  belongs_to :meal
  belongs_to :delivery_order
end
