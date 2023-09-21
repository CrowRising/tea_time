require 'rails_helper'

RSpec.describe Customer, type: :model do
    describe 'relationships' do
        it { should have_many(:customer_subscriptions) }
        it { should have_many(:subscriptions).through(:customer_subscriptions) }
    end

    describe 'instance methods' do
        it 'can return active scripts' do
            customer1 = Customer.create!(name: 'Barry Whyte', email: 'yourmom@email', password: 'test')
            subscription1 = Subscription.create!(title: 'Crack', price: 10.99, frequency: 1)
            expect(customer1.active_scripts.count).to eq(0)

            customer_script1 = CustomerSubscription.create!(customer_id: customer1.id, subscription_id: subscription1.id, status: 0)
            expect(customer1.active_scripts.count).to eq(1)

            customer_script1.update(status: 1)
            expect(customer1.active_scripts.count).to eq(0)
        end

        it 'can return inactive scripts' do
            customer1 = Customer.create!(name: 'Barry Whyte', email: 'yourmom@email', password: 'test')
            subscription1 = Subscription.create!(title: 'Crack', price: 10.99, frequency: 1)
            expect(customer1.inactive_scripts.count).to eq(0)

            customer_script1 = CustomerSubscription.create!(customer_id: customer1.id, subscription_id: subscription1.id, status: 0)
            expect(customer1.inactive_scripts.count).to eq(0)

            customer_script1.update(status: 1)
            expect(customer1.inactive_scripts.count).to eq(1)
        end
    end
end