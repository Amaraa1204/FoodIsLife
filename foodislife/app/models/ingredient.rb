class Ingredient < ApplicationRecord
  belongs_to :Category, :foreign_key=>'categoryId'
end
