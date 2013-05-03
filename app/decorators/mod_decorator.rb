class ModDecorator < Draper::Decorator
  delegate_all

  def primary_image
    images.first.image
  end

  def description(limit)
    h.raw Markdowner.new(source.description.truncate(250)).render!
  end
end
