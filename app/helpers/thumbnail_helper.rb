module ThumbnailHelper
  def gallery(resources)
    if resources.any?
      render partial: "thumbnails", locals: { resources: resources }
    else
      render partial: "alert_box", locals: { message: "There is nothing we have to show currently, sorry!" }
    end
  end

  def thumblink(image, link = "#")
    link_to image, link, class: "thumbnail", data: toggle("lightbox")
  end
end
