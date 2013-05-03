module ApplicationHelper
  def view_title(title)
    if title.present?
      "Kerbal Space Station - #{title}"
    else
      "Kerbal Space Station"
    end
  end

  def view_description(description)
    if description.present?
      "Kerbal Space Station is a free and open community for KSP mods. #{desription}"
    else
      "Kerbal Space Station is a free and open community for KSP mods."
    end
  end

  def view_keywords(keywords = [])
    if keywords.any?
      ["Kerbal Space Program", "Game", "Mods", "Ships"] + keywords
    else
      ["Kerbal Space Program", "Game", "Mods", "Ships"]
    end.join(", ")
  end

  def view_author(authors = [])
    if authors.any?
      ["Kurtis Rainbolt-Greene (@krainboltgreene)"] + authors
    else
      ["Kurtis Rainbolt-Greene (@krainboltgreene)"]
    end.join(", ")
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
    "UA-18715035-6"
  end

  def view_analytics_domain
    "kerbal-space-station.herokuapp.com"
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
