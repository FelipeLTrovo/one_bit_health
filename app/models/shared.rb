# == Schema Information
#
# Table name: shareds
#
#  id              :bigint           not null, primary key
#  user_id         :bigint           not null
#  duedate         :date
#  professional_id :bigint
#  integer_id      :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Shared < ApplicationRecord
  belongs_to :user
  belongs_to :professional, class_name: "User", foreign_key: "professional_id"

  validates :user_id, presence: true
  validates :professional_id, presence: true

  validate :uniqueness_registry
  before_validation :set_duedate
  before_update :check_duedate

  private

  def set_duedate
    if self.duedate.nil?
      self.duedate = Date.current + 7.days
    end
  end

  def uniqueness_registry
    if Shared.where(professional: self.professional, user: self.user, duedate: self.duedate).any?
      errors.add(:duedate, 'Não pode haver compartilhamentos repetidos')
    end
  end

  def check_duedate
    errors.add(:duedate, 'Data não pode ser menor que a atual') if self.duedate < Date.current
  end

end
