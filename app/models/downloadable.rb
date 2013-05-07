class Downloadable < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  belongs_to :account
  has_many :images, dependent: :destroy, order: :id
  has_and_belongs_to_many :tags

  mapping do
    indexes :name, boost: 10
    indexes :description # analyzer: 'snowball'
  end

  index_name INDEX_NAME

  accepts_nested_attributes_for :images

  validates :name, presence: true, uniqueness: true
  validates :version, presence: true, format: /\d+\.\d+\.\d+/
  validates :compatible, presence: true

  attr_accessible :name
  attr_accessible :description
  attr_accessible :version
  attr_accessible :compatible
  attr_accessible :tags
  attr_accessible :upload
  attr_accessible :source
  attr_accessible :license, :license_name
  attr_accessible :images, :images_attributes
  attr_accessible :download_count, :bookmark_count

  def self.search(q)
    tire.search(load: true) do
      query { string q, default_operator: "AND" } if q.present?
    end
  end
end
