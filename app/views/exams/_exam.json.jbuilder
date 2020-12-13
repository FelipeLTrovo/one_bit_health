json.extract! exam, :id, :title, :description, :exam_date, :place, :created_at, :updated_at
json.url exam_url(exam, format: :json)
