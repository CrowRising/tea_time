class CustomerSerializer
  include JSONAPI::Serializer
    attributes :name, :email, :password
end