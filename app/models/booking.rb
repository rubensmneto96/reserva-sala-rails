class Booking < ApplicationRecord
    validates :full_name, :email, :room, :date, :user_id, presence: true
    belongs_to :user, optional: true
end
