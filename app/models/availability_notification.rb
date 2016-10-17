class AvailabilityNotification < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :book,:user, presence:true
end
