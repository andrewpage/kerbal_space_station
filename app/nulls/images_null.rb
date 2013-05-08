class ImagesNull
  def first
    ImageNull.new
  end
  alias_method :shift, :first

  def any?
    false
  end

  def persisted?
    false
  end
end
