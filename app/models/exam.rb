class Exam < ApplicationRecord
  validates :title, :description, :exam_date, :place, presence: true

end
