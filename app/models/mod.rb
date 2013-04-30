class Mod < Downloadable
  has_many :photos, dependent: :destroy

  validates :install, presence: true
  validates :changelog, presence: true

  attr_accessible :changelog
  attr_accessible :install
end
