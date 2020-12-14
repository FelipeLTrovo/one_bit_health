# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
  validates :content, presence: true
  has_many :tag_kinds
  has_many :treatments, through: :tag_kinds, source: :tagable, source_type: 'Treatment'
  has_many :appointments, through: :tag_kinds, source: :tagable, source_type: 'Appointment'
  has_many :exams, through: :tag_kinds, source: :tagable, source_type: 'Exam'
end
