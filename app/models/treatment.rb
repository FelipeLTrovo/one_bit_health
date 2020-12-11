# == Schema Information
#
# Table name: treatments
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  date        :datetime
#  local       :string
#  kind        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Treatment < ApplicationRecord
  has_many :tag_kinds, as: :tagable, dependent: :destroy
  has_many :tags, through: :tag_kinds

  validates :title, :description, :date, :local, :kind, presence: true
end
