# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.patient?
      cannot :manage, Tag
      can :manage, [User] do |user|
        user.id == user.id
      end      
      can :manage, [Exam] do |exam|
        exam.user_id == user.id
      end
      can :manage, [Treatment] do |treatment|
        treatment.user_id == user.id
      end
      can :manage, [Shared] do |shared|
        [shared.user_id, shared.professional_id].include? user.id
      end
      can :manage, [Appointment] do |appointment|
        appointment.user_id == user.id
      end
    end
  end
end
