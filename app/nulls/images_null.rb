class ImagesNull
  def first
    ImageNull.new
  end
  alias_method :shift, :first

  def any?
    false
  end

  def id
    rand(1..100)
  end
end
