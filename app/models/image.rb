class Image < ActiveRecord::Base
  belongs_to :downloadable

  mount_uploader :image, ImageUploader

  attr_accessible :primary
  attr_accessible :image

  def to_s
    image.to_s
  end

  def large
    image.large
  end

  def medium
    image.medium
  end

  def thumbnail
    image.thumbnail
  end
end
