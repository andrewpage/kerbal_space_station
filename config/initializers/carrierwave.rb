CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: ENV["AMAZON_S3_KEY"],
    aws_secret_access_key: ENV["AMAZON_S3_SECRET"],
    region: "us-west-2"
  }
  config.fog_directory  = ENV["AMAZON_BUCKET"]
  config.fog_public     = true
end
