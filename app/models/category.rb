class Category < ApplicationRecord
	has_many :recipe, inverse_of: :category, autosave: true
	accepts_nested_attributes_for :recipe, allow_destroy: true
end
