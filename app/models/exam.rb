# == Schema Information
#
# Table name: exams
#
#  id          :bigint           not null, primary key
#  description :text
#  exam_date   :date
#  place       :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_exams_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Exam < ApplicationRecord
  belongs_to :user
  validates :title, :description, :exam_date, :place, presence: true

end
