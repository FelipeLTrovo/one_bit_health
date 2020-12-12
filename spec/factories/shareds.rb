# == Schema Information
#
# Table name: shareds
#
#  id              :bigint           not null, primary key
#  user_id         :bigint           not null
#  duedate         :date
#  professional_id :bigint
#  integer_id      :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :shared do
    user
    duedate { 7.days.from_now }
    professional { association :user }
  end
end
