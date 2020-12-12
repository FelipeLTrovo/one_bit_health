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
FactoryBot.define do
  factory :shared do
    user
    duedate { 7.days.from_now }
    professional { association :user }
  end
end
