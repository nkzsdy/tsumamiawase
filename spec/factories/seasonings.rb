FactoryBot.define do
  factory :seasoning do
    name { |n| "seasoning#{n}" }
    user_id { |n| n }
  end
end
