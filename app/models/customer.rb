# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :customer_subscriptions
  has_many :subscriptions, through: :customer_subscriptions

  def active_scripts
    subscriptions.where('customer_subscriptions.status = ?', 0)
  end

  def inactive_scripts
    subscriptions.where('customer_subscriptions.status = ?', 1)
  end
end
