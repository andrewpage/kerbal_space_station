module ButtonHelper
  def button_to(text, path, options = {})
    link_to raw(text), path, options.merge!(class: "btn #{options[:class]}")
  end

  def download_button
    buttoner("download", "Download")
  end

  def upload_button
    buttoner("upload", "Upload")
  end

  def version_button(mod)
    "Version #{mod.version} #{caret_tag}"
  end

  def compatible_button(mod)
    "KSP #{mod.compatible} #{caret_tag}"
  end

  def like_button
    buttoner("thumbs-up", "Like")
  end

  def dislike_button
    buttoner("thumbs-down", "Dislike")
  end

  def bookmark_button
    buttoner("bookmark", "Bookmark")
  end

  def delete_button(have_text = true)
    buttoner("trash", "Delete", have_text)
  end

  def edit_button
    buttoner("edit", "Change")
  end

  def close_button(type)
    content_tag :button, icon_tag("remove-sign"), class: "close", data: dismiss(type)
  end

  def buttoner(icon, text = nil, have_text = true)
    raw(have_text ? "#{icon_tag(icon)} #{text}" : icon_tag(icon))
  end
end
