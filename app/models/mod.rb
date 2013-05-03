class Mod < Downloadable

  validates :install, presence: true
  validates :changelog, presence: true, on: :update

  attr_accessible :changelog
  attr_accessible :install
end
