class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWave::Processing::MiniMagick
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  storage :fog

  def store_dir
    "uploads/#{Rails.env}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fill: [1366, 768]
  process shave: [1366, 768]
  process :strip
  process convert: "jpeg"
  process quality: 95

  version :large do
    process resize_to_fill: [925, 575]
    process shave: [925, 575]
    process :strip
    process convert: "jpeg"
    process quality: 85
  end

  version :medium do
    process resize_to_fill: [300, 300]
    process shave: [300, 300]
    process convert: "jpeg"
    process quality: 65
    process fuzz: 3
  end

  version :thumbnail do
    process resize_to_fill: [124, 124]
    process shave: [124, 124]
    process convert: "jpeg"
    process quality: 50
    process fuzz: 5
  end

  def filename
    super.chomp(File.extname(super)) + ".jpeg"
  end

  def fuzz(percent)
    manipulate! do |image|
      image.tap { |i| i.fuzz("#{percent}%") }
    end
  end

  def trim
    manipulate! do |image|
      image.tap { |i| i.trim }
    end
  end

  def shave(height, width)
    manipulate! do |image|
      image.tap { |i| i.shave("#{height}x#{width}") }
    end
  end
end
