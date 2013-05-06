if defined?(AssetSync) && !(ENV["HOME"] == "/app")
  AssetSync.configure do |config|
    config.fog_provider = "AWS"
    config.fog_directory = ENV["AMAZON_BUCKET"]
    config.aws_access_key_id = ENV["AMAZON_S3_KEY"]
    config.aws_secret_access_key = ENV["AMAZON_S3_SECRET"]

    # Increase upload performance by configuring your region
    config.fog_region = "us-west-2"
    #
    # Don't delete files from the store
    config.existing_remote_files = ENV["ASSET_SYNC_EXISTING_REMOTE_FILES"]
    #
    # Automatically replace files with their equivalent gzip compressed version
    config.gzip_compression = ENV["ASSET_SYNC_GZIP_COMPRESSION"]
    #
    # Use the Rails generated 'manifest.yml' file to produce the list of files to
    # upload instead of searching the assets directory.
    config.manifest = ENV["ASSET_SYNC_MANIFEST"]
    #
    # Fail silently.  Useful for environments such as Heroku
    # config.fail_silently = true
  end
end
