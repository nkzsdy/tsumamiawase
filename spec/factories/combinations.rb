FactoryBot.define do
  factory :combination do
    user_id { |n| n }
    ingredient_id { |n| n }
    seasoning_id { |n| n }
  end
end
