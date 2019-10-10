class Combination < ApplicationRecord
  belongs_to :user
  belongs_to :ingredient
  belongs_to :seasoning

  accepts_nested_attributes_for :ingredient
  accepts_nested_attributes_for :seasoning

  validates :user_id,       presence: true
  validates :ingredient_id, presence: true
  validates :seasoning_id,  presence: true

  validates_uniqueness_of :ingredient_id, scope: :seasoning_id
end
