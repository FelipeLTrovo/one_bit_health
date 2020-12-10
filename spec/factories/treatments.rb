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
FactoryBot.define do
  factory :treatment do
    title "MyString"
    description "MyText"
    date "2020-12-10 16:57:15"
    local "MyString"
    kind 1
  end
end
