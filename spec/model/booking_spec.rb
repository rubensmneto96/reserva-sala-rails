require 'rails_helper'

RSpec.describe Booking, :type => :model do
    context "Validate booking"
    it "should validate" do
        booking = Booking.new(full_name: "Full Name", email: "email@example.com", room: "Room", date: DateTime.now, user_id: "User ID")
        expect(booking).to be_valid
    end

    it "should not validate" do
        booking = Booking.new(full_name: nil, email: nil, room: nil, date: nil, user_id: nil)
        expect(booking).not_to be_valid
    end
end