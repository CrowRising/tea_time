require 'rails_helper'

RSpec.describe 'Customer Subscriptions API' do
  describe 'happy path' do
    it 'can create a customer subscription' do
      customer1 = Customer.create!(name: 'Barry Whyte', email: 'yourmom@email.com', password: 'test123')
      script1 = Subscription.create!(title: 'Crack', price: 10.99, frequency: 1)

      customer_script_params = {
                              customer_id: customer1.id,
                              subscription_id: script1.id,
      }

      post '/api/v1/customer_subscriptions', params: customer_script_params

      expect(response).to be_successful
      expect(response.status).to eq(201)

      res = JSON.parse(response.body, symbolize_names: true)
      expect(res[:message]).to eq('Subscription created')
    end

    it 'can reactivate a customer subscription' do
      customer1 = Customer.create!(name: 'Barry Whyte', email: 'yourmom@email.com', password: 'test123')
      script1 = Subscription.create!(title: 'Crack', price: 10.99, frequency: 1)
      CustomerSubscription.create!(customer_id: customer1.id,
                                  subscription_id: script1.id, status: 1)

      customer_script_params = {
                              customer_id: customer1.id,
                              subscription_id: script1.id,
      }

      post '/api/v1/customer_subscriptions', params: customer_script_params

      expect(response).to be_successful
      expect(response.status).to eq(201)

      res = JSON.parse(response.body, symbolize_names: true)
      expect(res[:message]).to eq('Subscription reactivated')
    end

    it 'cannot reactivate an active customer subscription' do
      customer1 = Customer.create!(name: 'Barry Whyte', email: 'yourmom@email.com', password: 'test123')
      script1 = Subscription.create!(title: 'Crack', price: 10.99, frequency: 1)
      CustomerSubscription.create!(customer_id: customer1.id,
                                  subscription_id: script1.id, status: 1)

      customer_script_params = {
                              customer_id: customer1.id,
                              subscription_id: script1.id,
      }

      post '/api/v1/customer_subscriptions', params: customer_script_params

      expect(response).to be_successful
      expect(response.status).to eq(201)
    end
  end
end