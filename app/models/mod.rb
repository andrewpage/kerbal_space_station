class Mod < Downloadable
  MAXIMUM_IMAGES = 4

  validates :install, presence: true
  validates :changelog, presence: true, on: :update

  attr_accessible :changelog
  attr_accessible :install
end
