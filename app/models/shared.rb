# == Schema Information
#
# Table name: shareds
#
#  id              :bigint           not null, primary key
#  duedate         :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  integer_id      :bigint
#  professional_id :bigint
#  user_id         :bigint           not null
#
# Indexes
#
#  index_shareds_on_integer_id       (integer_id)
#  index_shareds_on_professional_id  (professional_id)
#  index_shareds_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (integer_id => users.id)
#  fk_rails_...  (professional_id => users.id)
#  fk_rails_...  (user_id => users.id)
#
class Shared < ApplicationRecord
  belongs_to :user
  belongs_to :professional, class_name: "User", foreign_key: "professional_id"
  validates :user_id, presence: true, uniqueness: { scope: [:professional_id, :duedate] }
  validates :professional_id, presence: true
  validates :duedate, presence: true, future_date: true
end
