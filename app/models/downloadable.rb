class Downloadable < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  VERSION_SKIP_FIELDS = [:description, :tags, :source, :images, :bookmark_count, :download_count, :name]

  belongs_to :account

  has_many :images, dependent: :destroy, order: :id, uniq: true
  has_and_belongs_to_many :tags, uniq: true

  has_paper_trail on: [:create, :update], only: :version, skip: VERSION_SKIP_FIELDS, versions: :releases, version: :release

  index_name INDEX_NAME

  mapping do
    indexes :name, boost: 10
    indexes :description # analyzer: 'snowball'
  end

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
  attr_accessible :license, :license_name
  attr_accessible :images, :images_attributes
  attr_accessible :download_count, :bookmark_count

  def self.search(q)
    tire.search(load: true) do
      query { string q, default_operator: "AND" } if q.present?
    end
  end

  def self.type(type_name)
    where(type: type_name)
  end
end
