require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

#画像名に日本語が使用可能
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory = 'lemonfish'
    #IAM_profile
    config.fog_credentials = {
      provider: 'AWS',
      #環境変数で管理
      aws_access_key_id: ["#{ENV['AWS_ACCESS_KEY_ID']}"],
      aws_secret_access_key: ["#{ENV['AWS_SECRET_ACCESS_KEY']}"],
      region: 'ap-northeast-1' #東京
    }
  end
end
