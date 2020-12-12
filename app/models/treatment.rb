# == Schema Information
#
# Table name: treatments
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  title       :string
#  description :text
#  date        :datetime
#  local       :string
#  kind        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Treatment < ApplicationRecord
  belongs_to :user
  has_many :tag_kinds, as: :tagable, dependent: :destroy
  has_many :tags, through: :tag_kinds
  has_many_attached :files

  enum kind: {medicamento: 0, cirurgia: 1, terapia: 2, alternativo: 3}

  validates :title, :description, :date, :local, :kind, presence: true

end
