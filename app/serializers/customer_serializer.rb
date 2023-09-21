# frozen_string_literal: true

class CustomerSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :password

  attribute :active_subscriptions do |customer|
    customer.active_scripts.map do |script|
      {
        id: script.id,
        title: script.title,
        price: script.price,
        frequency: script.frequency
      }
    end
  end

  attribute :inactive_subscriptions do |customer|
    customer.inactive_scripts.map do |script|
      {
        id: script.id,
        title: script.title,
        price: script.price,
        frequency: script.frequency
      }
    end
  end
end
