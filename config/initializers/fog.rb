
CarrierWave.configure do |config|
  config.fog_credentials = {
  
  #Configuration for Amazon S3
  
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAJF2G3XHMDSIW22KQ',       # required
    :aws_secret_access_key  => '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',                        # required
    #:region                 => ENV['us-west-1'],                 # optional, defaults to 'us-east-1'
    #:host                   => 's3.amazonaws.com',           # optional, defaults to nil
    #:endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'cartoncanoeproducts'                     # required
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}

end