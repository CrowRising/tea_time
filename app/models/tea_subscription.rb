# frozen_string_literal: true

class TeaSubscription < ApplicationRecord
  belongs_to :tea
  belongs_to :subscription
end
