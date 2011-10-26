class Service < ActiveRecord::Base
  belongs_to :station

  validates_presence_of :station, :departs_at, :departs_at_label, :arrives_at, :arrives_at_label

  has_friendly_id :name, :use_slug => true
end