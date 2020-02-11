if Rails.env.production?
  CarrierWave.configure do |config|
        config.fog_provider = 'fog/aws'
        config.fog_credentials = {
        # Configuration for Amazon S3
        :provider              => 'AWS',
        :aws_access_key_id     => "AKIAYR5D5LBJQYSQEHNU",
        :aws_secret_access_key => "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",
        :region                => "ap-northeast-1",
  }
    config.cache_dir     = "#{Rails.root}/tmp/uploads"   # For Heroku
    config.fog_directory  = "rdlibrary"
    config.fog_public     = true
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
   end
end
