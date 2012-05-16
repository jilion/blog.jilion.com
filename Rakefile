require 'rake'
require 'aws/s3'


desc "Compile Jekyll site"
task :compile  => :prepare_assets do
  system "bundle exec ejekyll --no-server --no-auto"
  puts "Jekyll site had been generated."
end

desc "Jammitify assets, upload on AWS and"
task :prepare_assets do
  timestamp = Time.now.strftime("%m%d%Y%H%M%S")
  ENV['TIMESTAMP'] = timestamp

  system "bundle exec jammit -c assets.yml -o assets -u http://blog.medias.jilion.com/#{timestamp} -f"
  puts "Assets had been jammited"

  files = ["assets/style.css","assets/style-datauri.css","assets/style-mhtml.css"]

  files.each do |file|
    buffer = File.new(file,'r').read.gsub(/@media screen and\(/,"@media screen and (")
    File.open(file,'w') {|fw| fw.write(buffer)}
  end
  puts "Jammited CSSs had been cleaned to work with modern browsers"

  AWS::S3::Base.establish_connection!(
    access_key_id: ENV['S3_ACCESS_KEY_ID'],
    secret_access_key: ENV['S3_SECRET_ACCESS_KEY']
  )
  files = Dir.glob(File.join("assets/*"))
  files.each do |file|
    filekey = file.gsub(/\.\.\//,'')
    filekey = "#{timestamp}/#{filekey}"
    $stdout.print('.')
    $stdout.flush
    AWS::S3::S3Object.store(filekey, open(file), 'blog.jilion.com', :access => :public_read)
  end
  puts "Assets uploaded on Amazon S3"
end
