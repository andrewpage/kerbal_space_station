class DownloadableTagForm
  attr_accessor :downloadable
  attr_accessor :tags

  def initialize(downloadable, tag_names)
    self.downloadable = downloadable
    self.tags = tags_from(tag_names)
    self.downloadable.tags << self.tags
  end

  def valid?
    downloadable.valid? && tags.all?(&:valid?)
  end

  def save!
    downloadable.save! and tags.all?(&:save!)
  end

  private

  def tags_from(names)
    names.split(/,\s*/).map { |name| Tag.where(name: name).first_or_initialize }
  end
end
