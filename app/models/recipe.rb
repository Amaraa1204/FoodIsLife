class Recipe < ApplicationRecord
  belongs_to :Category, :foreign_key=>'categoryId'
  belongs_to :User, :foreign_key=>'authorId'
  mount_uploader :image, ImageUploader
  validates_processing_of :image
validate :image_size_validation
 
private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end
end


