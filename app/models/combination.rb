class Combination < ApplicationRecord
  belongs_to :user
  belongs_to :ingredient
  belongs_to :seasoning
end
