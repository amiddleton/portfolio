class Project < ActiveRecord::Base
  attr_accessible :title, :content, :image, :caption

  validates :title, :content, presence: true

  mount_uploader :image, ImageUploader

end
