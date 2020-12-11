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
class TagKind < ApplicationRecord
  belongs_to :tag
  belongs_to :tagable, polymorphic: true
end
