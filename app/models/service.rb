class Service < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  geocoded_by :address
end
