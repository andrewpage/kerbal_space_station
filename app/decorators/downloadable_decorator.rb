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
    images.first.image
  end

  def description(limit = 10_000)
    h.raw Markdowner.new(source.description.truncate(limit)).render!
  end
end
