# == Schema Information
#
# Table name: tag_kinds
#
#  id           :bigint           not null, primary key
#  tagable_type :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  tag_id       :bigint           not null
#  tagable_id   :bigint           not null
#
# Indexes
#
#  index_tag_kinds_on_tag_id                       (tag_id)
#  index_tag_kinds_on_tagable_type_and_tagable_id  (tagable_type,tagable_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_id => tags.id)
#
FactoryBot.define do
  factory :tag_kind do
    tag
  end
end
