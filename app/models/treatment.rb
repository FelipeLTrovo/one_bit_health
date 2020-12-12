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
class Treatment < ApplicationRecord
  has_many :tag_kinds, as: :tagable, dependent: :destroy
  has_many :tags, through: :tag_kinds
  belongs_to :user

  enum kind: {medicamento: 0, cirurgia: 1, terapia: 2, alternativo: 3}

  validates :title, :description, :date, :local, :kind, presence: true

  has_many_attached :files
end
