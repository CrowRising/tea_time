FactoryBot.define do
    factory :tea do
        title { Faker::Tea.variety }
        description { Faker::Tea.type }
    end
end