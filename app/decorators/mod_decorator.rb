class ModDecorator < Draper::Decorator
  delegate_all

  def primary_image
    images.first.image
  end

  def description(limit = 10_000)
    h.raw Markdowner.new(source.description.truncate(limit)).render!
  end
end
