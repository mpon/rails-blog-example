namespace :scheduled do
  desc "Export"
  task :export => :environment do
    puts Article.all().to_json
    puts Comment.all().to_json
  end
end
