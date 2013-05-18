class Craft < Downloadable
  validates :file, presence: true, on: :create

  attr_accessible :file
  VALID_PARAMS = [
    :name,
    :version,
    :compatible,
    :description,
    :license,
    :tags,
    :upload,
    :images_attributes,
  ]
end
