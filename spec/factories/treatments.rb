# == Schema Information
#
# Table name: treatments
#
#  id          :bigint           not null, primary key
#  date        :datetime
#  description :text
#  kind        :integer
#  local       :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_treatments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :treatment do
    sequence(:title) {|n| "Treatment - #{n}"}
    description "MyText"
    date "2020-12-10 16:57:15"
    local "MyString"
    kind 1

    after :create do |treatment|
      create(:tag_kind, tag: create(:tag), tagable: treatment)
    end
  end
end
