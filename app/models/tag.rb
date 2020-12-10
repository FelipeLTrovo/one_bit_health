# == Schema Information
#
# Table name: tags
#
#  id           :bigint           not null, primary key
#  content      :string
#  tagable_type :string           not null
#  tagable_id   :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Tag < ApplicationRecord
  belongs_to :tagable, polymorphic: true
  validates :content, presence: true
end
