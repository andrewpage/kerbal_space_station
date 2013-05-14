class CraftDecorator < DownloadableDecorator
  delegate_all

  def filepicker_options
    {
      extension: "*.craft",
      services: ["COMPUTER"],
      button_text: "Upload Craft",
      drag_text: "Drop your craft file here.",
      button_class: "btn btn-success",
      multiple: false
    }
  end
end
