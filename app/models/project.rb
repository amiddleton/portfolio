class Project < ActiveRecord::Base
  attr_accessible :title, :content, :image

  validates :title, :content, presence: true

  mount_uploader :image, ImageUploader

end
