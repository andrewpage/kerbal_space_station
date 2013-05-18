class Mod < Downloadable
  MAXIMUM_IMAGES = 3
  VALID_PARAMS = [
    :name,
    :version,
    :compatible,
    :install,
    :description,
    :changelog,
    :license,
    :source,
    :tags,
    :upload,
    :images_attributes,
  ]

  validates :install, presence: true
  validates :changelog, presence: true, on: :update

  attr_accessible :changelog
  attr_accessible :install
  attr_accessible :source
end
