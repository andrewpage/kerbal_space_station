class ModDecorator < Draper::Decorator
  delegate_all

  def primary_image
    images.first.image
  end

  def description
    Markdowner.new(source.description).render!
  end
end
