# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Customer API' do
  describe 'happy path' do
    it 'can return customer data' do
      customer1 = Customer.create!(name: 'Barry Whyte', email: 'yourmom@email.com', password: 'test123')
      subscription1 = Subscription.create!(title: 'Crack', price: 10.99, frequency: 1)
      subscription2 = Subscription.create!(title: 'Chill', price: 20.99, frequency: 2)
      CustomerSubscription.create!(customer_id: customer1.id,
                                   subscription_id: subscription1.id, status: 0)
      CustomerSubscription.create!(customer_id: customer1.id,
                                   subscription_id: subscription2.id, status: 1)

      get '/api/v1/customers', params: { id: customer1.id }

      expect(response).to be_successful
      expect(response.status).to eq(200)

      res = JSON.parse(response.body, symbolize_names: true)

      expect(res).to be_a(Hash)
      expect(res).to have_key(:data)
      expect(res[:data]).to be_a(Hash)
      expect(res[:data]).to have_key(:id)
      expect(res[:data][:id]).to eq(customer1.id.to_s)
      expect(res[:data]).to have_key(:type)
      expect(res[:data][:type]).to eq('customer')
      expect(res[:data]).to have_key(:attributes)
      expect(res[:data][:attributes]).to be_a(Hash)

      expect(res[:data][:attributes]).to have_key(:name)
      expect(res[:data][:attributes][:name]).to eq(customer1.name)
      expect(res[:data][:attributes]).to have_key(:email)
      expect(res[:data][:attributes][:email]).to eq(customer1.email)
      expect(res[:data][:attributes]).to have_key(:active_subscriptions)
      expect(res[:data][:attributes][:active_subscriptions]).to be_an(Array)
      expect(res[:data][:attributes][:active_subscriptions].count).to eq(1)
      expect(res[:data][:attributes]).to have_key(:inactive_subscriptions)
      expect(res[:data][:attributes][:inactive_subscriptions]).to be_an(Array)
      expect(res[:data][:attributes][:inactive_subscriptions].count).to eq(1)
    end
  end

  describe 'sad path' do
    it 'returns 404 if customer not found' do
      get '/api/v1/customers', params: { id: 1 }

      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      res = JSON.parse(response.body, symbolize_names: true)

      expect(res).to be_a(Hash)
      expect(res).to have_key(:error)
      expect(res[:error]).to eq('Customer not found')
    end
  end
end
