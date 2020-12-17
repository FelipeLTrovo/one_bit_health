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
  factory :shared, class: Shared do
    user_id { create(:user).id }
    professional_id { create(:user).id }
  end
end
