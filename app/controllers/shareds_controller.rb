class SharedsController < ApplicationController
  def index
    @shareds = current_user.shareds
  end

  def new
    @shared = Shared.new
    @available_user = User.joins("inner join shareds on shareds.professional_id = users.id and shareds.user_id = #{current_user.id} and shareds.duedate > date('#{Date.current.to_date}')").joins("right join users p on p.id = shareds.professional_id").where( shareds: { id: nil }).where.not(p: {id: current_user.id}).select("p.*")
  end

  def create
    @shared = Shared.new(shared_params)

    respond_to do |format|
      if @shared.save
        format.html { redirect_to shareds_path, notice: 'Shared was successfully created.' }
        format.json { render :show, status: :created, location: @shared }
      else
        format.html { render :new }
        format.json { render json: @shared.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def shared_params
    params.require(:shared).permit(:professional_id).merge!(user_id: current_user.id)
  end
end
