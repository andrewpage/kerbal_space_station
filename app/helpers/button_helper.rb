module ButtonHelper
  def button_to(text, path, options = {})
    link_to raw(text), path, options.merge!(class: "btn #{options[:class]}")
  end

  def download_button
    icon_tag("download") + " Download"
  end

  def version_button(mod)
    "Version #{mod.version} #{caret_tag}"
  end

  def compatible_button(mod)
    "KSP #{mod.compatible} #{caret_tag}"
  end

  def like_button
    icon_tag("thumbs-up") + " Like"
  end

  def dislike_button
    icon_tag("thumbs-down") + " Dislike"
  end

  def bookmark_button
    icon_tag("bookmark") + " Bookmark"
  end

  def delete_button(have_text = true)
    buttoner(icon_tag("trash"), "Delete", have_text)
  end

  def edit_button
    icon_tag("edit") + " Change"
  end

  def close_button(type)
    content_tag :button, icon_tag("remove-sign"), class: "close", data: dismiss(type)
  end

  private

  def buttoner(icon, text, have_text)
    if have_text then "#{icon} #{text}" else icon end
  end
end
