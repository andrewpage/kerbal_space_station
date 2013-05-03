class Downloadable < ActiveRecord::Base
  belongs_to :account
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :images

  validates :name, presence: true, uniqueness: true
  validates :version, presence: true, format: /\d+\.\d+\.\d+/
  validates :compatible, presence: true

  attr_accessible :name
  attr_accessible :description
  attr_accessible :version
  attr_accessible :compatible
  attr_accessible :upload
  attr_accessible :images
end
