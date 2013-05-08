class Craft < Downloadable
  validates :file, presence: true, on: :create
  attr_accessible :file
end
