json.extract! booking, :id, :full_name, :email, :room, :date, :created_at, :updated_at
json.url booking_url(booking, format: :json)
