class Craft < Downloadable
  VALID_PARAMS = [
    :name,
    :version,
    :compatible,
    :description,
    :license,
    :tags,
    :upload,
    :images_attributes,
  ]
end
