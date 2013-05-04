class Image < ActiveRecord::Base
  belongs_to :downloadable

  mount_uploader :image, ImageUploader

  attr_accessible :primary
  attr_accessible :image

  def to_s
    image.to_s
  end

  def medium
    image.medium
  end

  def thumb
    image.thumb
  end
end
