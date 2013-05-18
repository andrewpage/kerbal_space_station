module ButtonHelper
  def button_to(text, path, options = {})
    link_to raw(text), path, options.merge!(class: "btn #{options[:class]}")
  end

  def download_button(has_text = true)
    buttoner("download", "Download", has_text)
  end

  def upload_button(has_text = true)
    buttoner("upload", "Upload", has_text)
  end

  def version_button(mod)
    "Version #{mod.version} #{caret_tag}"
  end

  def compatible_button(mod)
    "KSP #{mod.compatible} #{caret_tag}"
  end

  def like_button(has_text = true)
    buttoner("thumbs-up", "Like", has_text)
  end

  def report_button(has_text = true)
    buttoner("flag", "Report", has_text)
  end

  def dislike_button(has_text = true)
    buttoner("thumbs-down", "Dislike", has_text)
  end

  def bookmark_button(has_text = true)
    buttoner("bookmark", "Bookmark", has_text)
  end

  def delete_button(has_text = true)
    buttoner("trash", "Delete", has_text)
  end

  def edit_button(has_text = true)
    buttoner("edit", "Change", has_text)
  end

  def close_button(type)
    content_tag :button, icon_tag("remove-sign"), class: "close", data: dismiss(type)
  end

  def buttoner(icon, text = nil, has_text = true)
    raw(has_text ? "#{icon_tag(icon)} #{text}" : icon_tag(icon))
  end
end
