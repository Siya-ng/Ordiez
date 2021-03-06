# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

OrderItem.destroy_all
DeliveryOrder.destroy_all
Meal.destroy_all
# === delivery_order seed
# DeliveryOrder.destroy_all
5.times do |c|
  new_delivery_order = DeliveryOrder.new
  random_number = rand(100..999)
  new_delivery_order.order_id = "GO#{random_number}"
  new_delivery_order.serving_datetime = DateTime.now + 2.hours
  new_delivery_order.save
end



# ===  Meal seed
# Meal.destroy_all
10.times do |c|
  new_meal = Meal.create({
    name: Faker::Food.dish,
    description: Faker::Lorem.paragraph
})
end

# === OrderItem seed
# OrderItem.destroy_all

5.times do |c|
  new_order_item = OrderItem.new
  new_order_item.delivery_order_id = DeliveryOrder.all.sample.id
  new_order_item.meal_id = Meal.all.sample.id
  quantity = rand(1..5)
  new_order_item.quantity = quantity
  new_order_item.unit_price = rand(20..399) * 10
  new_order_item.save
end
