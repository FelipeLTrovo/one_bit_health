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
#
FactoryBot.define do
  factory :appointment do
    user_id { create(:user).id }
    sequence(:title) { |n| "Title #{n}" }
    description { Faker::Lorem.sentence }
    professional { Faker::Name.name }
    date { Time.zone.now }

    after :create do |appointment|
      create(:tag_kind, tag: create(:tag), tagable: appointment)
    end
  end
end
