class DownloadableDecorator < Draper::Decorator
  delegate_all

  def tag_names
    source.tags.map(&:name).join(",") if source.tags.any?
  end

  def liked_style
    "btn-success" if h.current_account.likes?(source)
  end

  def disliked_style
    "btn-danger" if h.current_account.dislikes?(source)
  end

  def bookmarked_style
    "btn-info" if h.current_account.bookmarks?(source)
  end

  def primary_image
    images.first
  end

  def images
    if source.images.any? || new_record? then source.images else ImagesNull.new end
  end

  def description_short(limit)
    h.raw Markdowner.new(source.description.split("\n").first.truncate(limit)).render!
  end

  def description
    h.raw Markdowner.new(source.description || "").render!
  end

  def install
    h.raw Markdowner.new(source.install).render!
    h.raw Markdowner.new(source.install || "").render!
  end

  def changelog
    h.raw Markdowner.new(source.changelog || "").render!
  end

  def license
    h.raw Markdowner.new(source.license || "").render!
  end

  def license_name
    if license.present?
      source.license.split("\n").first
    else
      "No"
    end
  end
end
