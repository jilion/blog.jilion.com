require 'aws/s3'

namespace :deploy do
  desc "Jammitify assets, upload on AWS and deploy on Heroku [PRODUCTION]"
  task :production do
    timestamp = prepare_and_upload_assets
    
    ENV['RACK_ENV'] = 'production'
    ENV['TIMESTAMP'] = timestamp
    system "bundle exec ejekyll --no-server --no-auto"
    
    puts "Full blog has been generated for production"
    
    system "git add ."
    system "git commit -m 'Updated assets before deploy [PRODUCTION]'"
    system "git push origin production"
    system "git push git@heroku.com:blogjilion.git production:master"
    system "heroku restart"
    
    puts "The blog is running on Heroku, enjoy!"
  end
  
  desc "Jammitify assets, upload on AWS and deploy on Heroku [STAGING]"
  task :staging do
    timestamp = prepare_and_upload_assets
    
    ENV['RACK_ENV'] = 'staging'
    ENV['TIMESTAMP'] = timestamp
    system "bundle exec ejekyll --no-server --no-auto"
    
    puts "Full blog has been generated for production"
    
    system "git add ."
    system "git commit -m 'Updated assets before deploy [STAGING]'"
    system "git push origin staging"
    system "git push git@heroku.com:blogjilion-staging.git staging:master"
    system "heroku restart"
    
    puts "The blog is running on Heroku, enjoy!"
  end
end

def prepare_and_upload_assets
  timestamp = Time.now.strftime("%m%d%Y%H%M%S")
  system "jammit -c assets.yml -o assets -u http://blog.medias.jilion.com/#{timestamp} -f"
  
  files = ["assets/style.css","assets/style-datauri.css","assets/style-mhtml.css"]
  
  files.each do |file|
    buffer = File.new(file,'r').read.gsub(/@media screen and\(/,"@media screen and (")
    File.open(file,'w') {|fw| fw.write(buffer)}
  end
  
  puts "Jammited CSSs had been cleaned to work with modern browsers"
  
  AWS::S3::Base.establish_connection!(
    :access_key_id     => '0BNK5HS36QFNVCVRBBG2',
    :secret_access_key => 'zGODjlVgFrfcvNfqDo7aMBMUrpQsvY+mIBwpf+lQ'
  )
  
  files = Dir.glob(File.join("assets/*"))
  
  files.each do |file|
    filekey = file.gsub(/\.\.\//,'')
    filekey = "#{timestamp}/#{filekey}"
    $stdout.print('.')
    $stdout.flush
    AWS::S3::S3Object.store(filekey, open(file), 'blog.jilion.com', :access => :public_read)
  end
  
  puts "Finished uploaded assets on Amazon S3"
  return timestamp
end