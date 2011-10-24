class Station < ActiveRecord::Base
  has_many :services

  has_friendly_id :name, :use_slug => true

  def self.next id, limit=5
    now = Vliner::Scraper.get_seconds_from_timestamp(Time.now.strftime('%H:%M'))
    ServiceDecorator.decorate(Station.find(id).services.select { |x| x.departs_at > now }[1..limit])
  end
end