namespace :scheduled do
  desc "Get First Article"
  task :get_first_article => :environment do
    puts Article.first().to_json
  end
end
