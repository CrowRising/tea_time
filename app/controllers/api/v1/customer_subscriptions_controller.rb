# frozen_string_literal: true

module Api
  module V1
    class CustomerSubscriptionsController < ApplicationController
      def create
        customer_subscription = CustomerSubscription.find_by(customer_script_params)
        if customer_subscription
          if customer_subscription.status == 'inactive'
            customer_subscription.update(status: 'active')
            render json: { message: 'Subscription reactivated' }, status: 201
          else
            render json: { message: 'Subscription already active' }, status: 400
          end
        else
          new_customer_subscription = CustomerSubscription.new(customer_script_params)
          if new_customer_subscription.save
            render json: { message: 'Subscription created' }, status: 201
          else
            render json: { message: 'Subscription not created' }, status: 400
          end
        end
      end

      def update; end

      private

      def customer_script_params
        params.permit(:customer_id, :subscription_id)
      end
    end
  end
end
