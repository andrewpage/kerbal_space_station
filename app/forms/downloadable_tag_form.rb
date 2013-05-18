class DownloadableTagForm
  attr_accessor :downloadable
  attr_writer :tags

  def initialize(downloadable, parameters)
    self.downloadable = downloadable
    self.tags = parameters.delete("tags")
    self.downloadable.assign_attributes(parameters)
    self.downloadable.tags << tags
  end

  def valid?
    downloadable.valid? && tags.all?(&:valid?)
  end

  def save!
    downloadable.save!
  end

  def tags
    @tags.split(/,\s*/).map { |name| Tag.where(name: name).first_or_initialize }
  end
end
