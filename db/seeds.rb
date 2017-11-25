# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# OrderItem.destroy_all

# === delivery_order seed
# DeliveryOrder.destroy_all
# 5.times do |c|
#   new_delivery_order = DeliveryOrder.new
#   random_number = rand(100..999)
#   new_delivery_order.order_id = "G#{random_number}"
#   new_delivery_order.serving_datetime = DateTime.now
#   new_delivery_order.save
# end

# ===  Meal seed
# Meal.destroy_all
# 5.times do |c|
#   new_meal = Meal.new
#   new_meal.name = Faker::Food.dish
#   new_meal.description = Faker::Lorem.paragraph
#   new_meal.save
# end


# === OrderItem seed
# OrderItem.destroy_all

# 5.times do |c|
#   new_order_item = OrderItem.new
#   new_order_item.delivery_order_id = DeliveryOrder.all.sample.id
#   new_order_item.meal_id = Meal.all.sample.id
#   quantity = rand(1..9)
#   new_order_item.quantity = quantity
#   new_order_item.unit_price = 10 * quantity
#   new_order_item.save
# end
