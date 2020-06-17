class Ingredient < ApplicationRecord
  belongs_to :Category, :foreign_key=>'categoryId'

  validates :name, presence: true
  validates :categoryId, presence: true
end
