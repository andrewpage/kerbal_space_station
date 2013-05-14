class Mod < Downloadable
  MAXIMUM_IMAGES = 3
  VALID_PARAMS = [:name, :upload, :images_attributes, :install, :description, :changelog, :version, :compatible, :license, :source]

  validates :install, presence: true
  validates :changelog, presence: true, on: :update

  attr_accessible :changelog
  attr_accessible :install
  attr_accessible :source
end
