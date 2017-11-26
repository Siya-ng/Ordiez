# Ordiez

## Installation

#### Run bundle install

```
$bundle
```

## Create database for both production and testing

#### Create db
```
$rails db:create
$rake db:migrate db:test:prepare
```

#### Run the seeds file

* to view in browser
```
$rails db:seed
```

* for the test
```
$rake db:seed RAILS_ENV=test
```

#### View endpoints in browser

```
$rails s
```
Go to the localhost stated.

* Path: /orders
Should contains 5 DeliveryOrders


* Path: /orders/:order_id
Get the order_id of one of the delivery_order stated in (Path: /orders) and input as order_id
It should contain the information of the particular Delivery Order

#### Run test

##### Model Test
* DeliveryOrder

```
$rspec spec/models/delivery_order_spec.rb
```
Contains 5 tests

* Meal
```
$rspec spec/models/meal_spec.rb
```
Contains 4 tests

* Order Item
```
$rspec spec/models/order_item_spec.rb
```
Contains 7 tests

##### Controller Test
* orders

```
$rspec spec/controllers/orders_controller_spec.rb
```
Contains 6 tests

####  Created With:
* ruby 2.4.2p198
* rails 5.1.4

* rails-rspec 3.6
* faker
