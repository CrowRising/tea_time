# frozen_string_literal: true

class Subscription < ApplicationRecord
  has_many :tea_subscriptions
  has_many :teas, through: :tea_subscriptions
  has_many :customer_subscriptions
  has_many :customers, through: :customer_subscriptions
end
