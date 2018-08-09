class Ingredient < ApplicationRecord
  # before_destroy :children?
  has_many :doses
  validates :name, presence: true, uniqueness: true

  # def children?
  #   ingredient.errors.messages unless doses.any?
  # end
end
