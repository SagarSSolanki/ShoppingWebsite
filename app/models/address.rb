class Address < ApplicationRecord
  belongs_to :user

  validates :area, :city, :state, :pincode, presence: true
end
