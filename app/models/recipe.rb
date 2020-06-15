class Recipe < ApplicationRecord
  belongs_to :Category, :foreign_key=>'categoryId'
  belongs_to :User, :foreign_key=>'authorId'
end
