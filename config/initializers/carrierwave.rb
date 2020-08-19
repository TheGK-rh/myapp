#require 'carrierwave/storage/abstract'
#require 'carrierwave/storage/file'
#require 'carrierwave/storage/fog'

#画像名に日本語が使用可能
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAZKPQEHZ5GKTUJIN5',
      aws_secret_access_key: '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',
      use_iam_profile: true,
      region: 'ap-northeast-1' #東京
    }
    config.fog_directory = 'lemonfish'
  end
end
