class Image < ActiveRecord::Base
  belongs_to :downloadable

  mount_uploader :image, ImageUploader

  process_in_background :image
  store_in_background :image

  attr_accessible :primary
  attr_accessible :image, :image_processing

  def to_s
    image.to_s
  end

  def medium
    image.medium
  end

  def thumb
    image.thumb
  end

  def carousel
    image.carousel
  end
end
