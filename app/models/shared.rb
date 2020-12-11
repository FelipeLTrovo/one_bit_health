# == Schema Information
#
# Table name: shareds
#
#  id              :bigint           not null, primary key
#  user_id         :bigint           not null
#  duedate         :date             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Shared < ApplicationRecord
  
  belongs_to :user
  belongs_to :professional, class_name: "User", foreign_key: "professional_id"
  validates :user_id, presence: true, uniqueness: { scope: [:professional_id, :duedate] }
  validates :duedate, presence: true, future_date: true
  validates :professional_id, presence: true

end
