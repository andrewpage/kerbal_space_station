module NavigationHelper
  def item(tag, condition, &block)
    content_tag tag, class: active?(condition), &block
  end

  def active?(condition)
    "active" if condition
  end
end
