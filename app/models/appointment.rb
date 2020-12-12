# == Schema Information
#
# Table name: appointments
#
#  id           :bigint           not null, primary key
#  date         :datetime
#  description  :text
#  professional :string
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_appointments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Appointment < ApplicationRecord
  belongs_to :user
  validates :user_id, :title, :description, :professional, :date, presence: true
  has_many :exams, dependent: :destroy
end
