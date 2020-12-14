# == Schema Information
#
# Table name: exams
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  title       :string
#  description :text
#  exam_date   :date
#  place       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :exam do
    sequence(:title) { |n| "Exame #{n}" }
    description "Ultrasom de abdomen total"
    exam_date { Time.now }
    place "MyString"
    user_id { create(:user).id }

    after :create do |exam|
      create(:tag_kind, tag: create(:tag), tagable: exam)
    end
  end
end
