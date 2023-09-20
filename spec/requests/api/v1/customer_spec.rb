require 'rails_helper'

RSpec.describe 'Customer API' do
    describe 'happy path' do
        it 'can return customer data' do
            customer1 = Customer.create!(name: 'Barry Whyte', email: 'yourmom@email.com', password: 'test123')
            subscription1 = Subscription.create!(title: 'Crack', price: 10.99, frequency: 1)
            subscription2 = Subscription.create!(title: 'Chill', price: 20.99, frequency: 2)
            customer_script1 = CustomerSubscription.create!(customer_id: customer1.id, subscription_id: subscription1.id, status: 0)
            customer_script2 = CustomerSubscription.create!(customer_id: customer1.id, subscription_id: subscription2.id, status: 1)

            get '/api/v1/customers', params: {id: customer1.id}

            expect(response).to be_successful
            expect(response.status).to eq(200)

            res = JSON.parse(response.body, symbolize_names: true)

            expect(res).to be_a(Hash)

        end
    end
end
