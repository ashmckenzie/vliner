class Vliner::Scraper

  SECONDS_IN_AN_HOUR = 3600
  SECONDS_IN_A_MINUTE = 60

  GEELONG_TO_MELBOURNE = 'https://www.vline.com.au/apps/jp/tripplanner/GetTripRes.asp?return=0&origin=Geelong%20Station:%20Railway%20Terrace&destination=Melbourne,%20Southern%20Cross&DepDate=24/Oct/2011&RetDate=23/Oct/2011' #&ADFC=1&COFC=0&CHFC=0&CFFC=0&wks=10
  MELBOURNE_TO_GEELONG = 'https://www.vline.com.au/apps/jp/tripplanner/GetTripRes.asp?return=0&origin=Melbourne,%20Southern%20Cross&destination=Geelong%20Station:%20Railway%20Terrace&DepDate=24/Oct/2011&RetDate=23/Oct/2011' #&ADFC=1&COFC=0&CHFC=0&CFFC=0&wks=10
  MELBOURNE_TO_GEELONG_LOCAL = 'file:///Users/ash/Personal/vliner/tmp/melbourne_to_geelong.html'

  def initialize
    @url = MELBOURNE_TO_GEELONG_LOCAL
  end

  def self.get_seconds_from_timestamp timestamp
    hours, mins = timestamp.split(/:/)
    (hours.to_i * SECONDS_IN_AN_HOUR) + (mins.to_i * SECONDS_IN_A_MINUTE)
  end

  def self.get_timestamp_from_seconds seconds
    hours = 0
    mins = 0

    if seconds >= SECONDS_IN_AN_HOUR
      hours = (seconds / SECONDS_IN_AN_HOUR)
      seconds = seconds - (hours * SECONDS_IN_AN_HOUR)
    end

    if seconds >= SECONDS_IN_A_MINUTE
      mins = (seconds / SECONDS_IN_A_MINUTE)
    end

    "#{hours}:#{mins}"
  end

  def scrape
    a = Mechanize.new do |agent|
      agent.user_agent_alias = 'Mac Safari'
    end

    station = Station.find_by_name('Melbourne Southern Cross')

    a.get(@url) do |page|
      page.parser.css('table#Trips').each do |row|
        row.css('tr').select { |x| !x.attr('style').nil? && x.attr('style').index('background-color') }.each do |service|

          departs_at_label = service.css('td')[3].children[1].text
          departs_at = Vliner::Scraper::get_seconds_from_timestamp(service.css('td')[3].children[1].text)

          arrives_at_label = service.css('td')[4].children[1].text
          arrives_at = Vliner::Scraper::get_seconds_from_timestamp(service.css('td')[4].children[1].text)

          s = Service.find_or_create_by_station_id_and_departs_at_and_arrives_at(
            :station_id => station.id,
            :departs_at => departs_at,
            :departs_at_label => departs_at_label,
            :terminates_at => arrives_at,
            :terminates_at_label => arrives_at_label
          )
        end
      end
    end
  end

end
