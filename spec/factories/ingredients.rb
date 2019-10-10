FactoryBot.define do
  factory :ingredient do
    name { |n| "ingredient#{n}" }
    user_id { |n| n }
  end
end
