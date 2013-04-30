class Mod < Downloadable

  validates :install, presence: true
  validates :changelog, presence: true

  attr_accessible :changelog
  attr_accessible :install
end
