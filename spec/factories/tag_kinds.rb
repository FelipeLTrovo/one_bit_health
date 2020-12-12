# == Schema Information
#
# Table name: tag_kinds
#
#  id           :bigint           not null, primary key
#  tag_id       :bigint           not null
#  tagable_type :string           not null
#  tagable_id   :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :tag_kind do
    tag
  end
end
