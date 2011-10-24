class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_time_zone

  def set_time_zone
    Time.zone = 'Australia/Melbourne'
  end
end
