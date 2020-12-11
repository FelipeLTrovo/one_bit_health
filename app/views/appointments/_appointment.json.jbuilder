json.extract! appointment, :id, :user_id, :title, :description, :professional, :date, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
