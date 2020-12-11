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
    user nil
    title "MyString"
    description "MyString"
    professional "MyString"
    date "2020-12-09 00:26:24"
  end
end
