class Markdowner
  DEFAULT_OPTIONS = { autolink: true, space_after_headers: true }
  DEFAULT_RENDERER = Redcarpet::Render::HTML

  attr_accessor :text
  attr_accessor :options

  def initialize(text, options = {})
    self.text = text
    self.options = options
  end

  def render!(renderer = DEFAULT_RENDERER)
    engine(renderer).render(text)
  end

  private

  def engine(renderer)
    Redcarpet::Markdown.new(renderer, DEFAULT_OPTIONS.dup.merge!(options))
  end
end
