# frozen_string_literal: true

class CustomerSubscription < ApplicationRecord
  belongs_to :customer
  belongs_to :subscription

  enum status: { active: 0, inactive: 1 }

  validates :customer_id, presence: true
  validates :subscription_id, presence: true
end
