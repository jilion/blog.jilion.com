namespace :assets do
  desc 'Precompile assets'
  task :precompile do
    if ENV['RACK_ENV'] == 'production'
      sh "bundle exec ejekyll build --config _config_production.yml"
    else
      sh "bundle exec ejekyll build"
    end
  end
end
