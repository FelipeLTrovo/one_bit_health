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
  has_many :tags, as: :tagable
end
