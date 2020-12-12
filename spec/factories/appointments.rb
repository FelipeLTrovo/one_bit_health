# == Schema Information
#
# Table name: appointments
#
#  id           :bigint           not null, primary key
#  date         :datetime
#  description  :text
#  professional :string
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_appointments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :appointment do
    user_id { create(:user).id }
    sequence(:title) { |n| "Title #{n}" } 
    description { Faker::Lorem.sentence } 
    professional { Faker::Name.name }
    date { Time.zone.now }
  end
end
