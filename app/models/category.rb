class Category < ApplicationRecord
	 validates :categoryId, presence: true
	  validates :name, presence: true
end
