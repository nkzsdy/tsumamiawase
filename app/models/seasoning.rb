class Seasoning < ApplicationRecord
  belongs_to :user
  has_many :ingredients, through: :combinations
  has_many :combinations

  validates :name, presence: true
  validates_uniqueness_of :name, scope: :user_id
end
