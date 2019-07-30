class Dose < ApplicationRecord

  validates :description, presence: true

  belongs_to :ingredient
  belongs_to :cocktail
end
