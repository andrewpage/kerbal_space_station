class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  storage :fog

  def store_dir
    "uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fit => [800, 600]

  version :carousel do
    process :resize_to_fit => [800, 600]
  end

  version :medium do
    process :resize_to_fill => [300, 300]
  end

  version :thumb do
    process :resize_to_fill => [50, 50]
  end
end
