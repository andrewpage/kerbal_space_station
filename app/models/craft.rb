class Craft < Downloadable
  VALID_PARAMS = [:name, :file, :images_attributes, :description, :compatible, :tags]
  validates :file, presence: true, on: :create
  attr_accessible :file
end
