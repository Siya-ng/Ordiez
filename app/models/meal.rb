class Meal < ApplicationRecord
  validates_presence_of :name, :description
  has_many :order_items
end
