# == Schema Information
#
# Table name: appointments
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
#  title        :string
#  description  :text
#  professional :string
#  date         :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  tagable_type :string           not null
#  tagable_id   :bigint           not null
#
class Appointment < ApplicationRecord
  belongs_to :user
  has_many :tag_kinds, as: :tagable, dependent: :destroy
  has_many :tags, through: :tag_kinds
  has_many_attached :files

  validates :user_id, :title, :description, :professional, :date, presence: true
end
