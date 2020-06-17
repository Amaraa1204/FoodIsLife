class Category < ApplicationRecord
	 validates :categoryId, presence: true
	  validates :Name, presence: true
end
