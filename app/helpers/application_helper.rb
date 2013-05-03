module ApplicationHelper
  def view_title(title)
    "Kerbal Space Station"
  end

  def view_description(description)

  end

  def view_keywords(keywords)

  end

  def view_author(authors)

  end

  def view_has_header?
    true
  end

  def view_has_footer?
    true
  end

  def view_full?
    @view_full
  end

  def view_analytics_account

  end

  def view_analytics_domain

  end

  def form_options(url = nil, as = resource_name)
    {
      as: as,
      url: url,
      html: {
        class: "form-horizontal"
      }
    }
  end

  def puts_form_options(url = nil, as = resource_name)
    {
      as: as,
      url: url,
      html: {
        method: :puts,
        class: "form-horizontal"
      }
    }
  end

  def icon_tag(icon, options = {})
    raw content_tag :i, nil, options.merge(class: "icon-#{icon} #{options[:class]}")
  end

  def button_to(text, path, options = {})
    link_to text, path, options.merge!(class: "btn #{options[:class]}")
  end

  def modal_link_to(text, path, options = {})
    link_to text, path, options.merge!(data: { toggle: "modal" })
  end

  def tooltip(title)
    { data: toggle("tooltip"), title: title }
  end

  def toggle(type)
    { toggle: type }
  end
end
