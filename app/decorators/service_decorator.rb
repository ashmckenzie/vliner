class ServiceDecorator < ApplicationDecorator
  decorates :service

  def departs_in
    (model.departs_at - Vliner::Scraper.get_seconds_from_timestamp(Time.now.strftime('%H:%M'))) / 60
  end

  def departs_at
    nice_datetime model.departs_at
  end

  def arrives_at
    nice_datetime model.arrives_at
  end

  def platform
    model.platform.upcase if model.platform
  end

  private

  def nice_datetime seconds
    timestamp =  Vliner::Scraper.get_timestamp_from_seconds(seconds)
    datetime = Time.parse("#{Time.now.strftime('%Y-%m-%d')} #{timestamp}")
    datetime.strftime('%Y-%m-%d %H:%M:%S %Z')
  end
end