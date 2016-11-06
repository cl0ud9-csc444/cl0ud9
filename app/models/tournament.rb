class Tournament < ApplicationRecord
  #belongs_to :host
  #belongs_to :golf_course
  has_many :scheduled_events
  has_many :unscheduled_events
  has_many :teams
  has_many :photos
  has_many :sponsorships
  has_many :ticket_types
  mount_uploader :logoLink, PhotoUploader
end
