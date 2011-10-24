require_relative File.join('..', 'vliner', 'scraper')

namespace :vliner do

  desc "Scrape VLine"
  task :scrape => :environment do
    vs = Vliner::Scraper.new
    vs.scrape
  end

end