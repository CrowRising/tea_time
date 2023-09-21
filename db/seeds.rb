# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
CustomerSubscription.destroy_all
Customer.destroy_all
TeaSubscription.destroy_all
Tea.destroy_all
Subscription.destroy_all

customer1 = Customer.create!(name: 'Barry Whyte', email: 'yourmom@email.com', password: 'test123')
customer2 = Customer.create!(name: 'Gloria Stien', email: 'cheers@email.com', password: 'test666')
Customer.create!(name: 'Bobby Brown', email: 'getdown@email.com', password: 'test1111')

script1 = Subscription.create!(title: 'Crack', price: 10.99, frequency: 1)
script2 = Subscription.create!(title: 'Chill', price: 20.99, frequency: 2)
script3 = Subscription.create!(title: 'English', price: 30.99, frequency: 3)

CustomerSubscription.create!(customer_id: customer1.id, subscription_id: script1.id, status: 0)
CustomerSubscription.create!(customer_id: customer1.id, subscription_id: script2.id, status: 1)
CustomerSubscription.create!(customer_id: customer1.id, subscription_id: script3.id, status: 0)
CustomerSubscription.create!(customer_id: customer2.id, subscription_id: script1.id, status: 0)
CustomerSubscription.create!(customer_id: customer2.id, subscription_id: script2.id, status: 0)
