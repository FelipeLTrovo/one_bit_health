module Permissions
  extend ActiveSupport::Concern

  included do
    before_action :permission, only: [:show, :index, :update, :destroy]
  end

  def permission
    duedate = Date.current - 7.days
    shared = Shared.where("duedate > ?", duedate)
    list = shared.select{ |s| [s.professional_id, s.user.id].include?(current_user.id) }
    @list = list.map{ |item| [item.professional_id, item.user_id] }.flatten.uniq
  end
  
end