class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  def store_dir
    "uploads/#{Rails.env}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fill: [1366, 768]
  process convert: "jpg"
  cloudinary_transformation quality: 95

  version :large do
    process resize_to_fill: [925, 575]
    process convert: "jpg"
    cloudinary_transformation quality: 80
  end

  version :medium do
    process resize_to_fill: [300, 300]
    process convert: "jpg"
    cloudinary_transformation quality: 75
  end

  def filename
    super.chomp(File.extname(super)) + ".jpeg"
  end
end
