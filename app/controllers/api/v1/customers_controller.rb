# frozen_string_literal: true

module Api
  module V1
    class CustomersController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response
      def show
        customer = Customer.find(params[:id])
        render json: CustomerSerializer.new(customer), status: :ok
      end

      private

      def record_not_found_response
        render json: { error: 'Customer not found' }, status: :not_found
      end
    end
  end
end
