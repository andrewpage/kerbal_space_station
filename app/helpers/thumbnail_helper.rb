module ThumbnailHelper
  def gallary(resources)
    render partial: "thumbnails", locals: { resources: resources }
  end

  def thumblink(image, link = "#")
    link_to image, link, class: "thumbnail"
  end
end
