if Rails.env.production?
  CarrierWave.configure do |config|
        config.fog_provider = 'fog/aws'
        config.fog_credentials = {
        # Configuration for Amazon S3
        :provider              => 'AWS',
        :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
        :aws_secret_access_key => ENV['S3_SECRET_KEY'],
        :region                => ENV['S3_REGION'],
  }
    config.cache_dir     = "#{Rails.root}/tmp/uploads"   # For Heroku
    config.fog_directory  = ENV['S3_BUCKET']
    config.fog_public     = true
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
   end
end
