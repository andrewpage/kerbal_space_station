class DownloadableDecorator < Draper::Decorator
  delegate_all

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
    if source.images.any? then source.images else ImagesNull.new end
  end

  def description(limit = 10_000)
    h.raw Markdowner.new(source.description.truncate(limit)).render!
  end

  def install
    h.raw Markdowner.new(source.install).render!
  end

  def changelog
    h.raw Markdowner.new(source.changelog).render!
  end

  def license
    h.raw Markdowner.new(source.license).render!
  end

  def license_name
    if license.present?
      license.split("\n").first
    else
      "No"
    end
  end
end
