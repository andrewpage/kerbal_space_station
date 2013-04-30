class Photo < ActiveRecord::Base
  belongs_to :downloadable

  mount_uploader :photo, PhotoUploader


  attr_accessible :primary
  attr_accessible :upload
end
