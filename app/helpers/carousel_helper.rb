module CarouselHelper
  def carousel(resources)
    if resources.any?
      render partial: "carousel", locals: { resources: resources }
    else
      render partial: "alert_box", locals: { message: "There is nothing we have to show currently, sorry!" }
    end
  end

  def active_item?(item, active)
    "active" if item == active
  end

  def carousel_indicators(number)
    content_tag :ul, class: "carousel-indicators" do
      (0..number.size).each(&method(:carousel_indicator_item))
    end
  end

  private

  def active_indicator?(number)
    "active" if number == 0
  end

  def carousel_indicator_item(number)
    content_tag(:li, class: active_indicator?(number), data: { target: "#carousel"})
  end
end
