class Image < ActiveRecord::Base
  belongs_to :downloadable

  mount_uploader :image, ImageUploader

  attr_accessible :primary
  attr_accessible :image
end
