require 'aws/s3'

desc "Jammitify assets, upload on AWS and deploy on Heroku"
task :deploy do
  
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
  
  ENV['RACK_ENV'] = 'production'
  ENV['TIMESTAMP'] = timestamp
  system "bundle exec ejekyll --no-server --no-auto"
  
  puts "Full blog has been generated for production"
  
  system "git commit . -m 'Updated assets before deploy'"
  system "git push"
  system "git push heroku"
  
  puts "The blog is running on Heroku, enjoy!"
  
end