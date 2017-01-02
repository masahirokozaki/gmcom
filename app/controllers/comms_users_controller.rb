class CommsUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comm, only: [:show, :edit, :update, :destroy]
  
  def update
    comm_user = CommUser.new
    comm_user.comm_id = params[:id]
    comm_user.user_id = current_user.id
    if CommUser.find_by(comm_id: params[:id], user_id: current_user.id)
      message = 'すでに参加済みです'
    else
      comm_user.save
      message = 'コミュニティに参加しました'
    end
    redirect_to comm_path(params[:id]), :notice => message
  end
  
  def destroy
    if CommUser.find_by(comm_id: params[:id], user_id: current_user.id)
      CommUser.destroy_all(comm_id: params[:id], user_id: current_user.id)
      message = 'コミュニティから退会しました'
    else
      message = 'コミュニティに参加していません'
    end
    redirect_to comm_path(params[:id]), :notice => message
  end
  
  private
    def set_comm
      @comms_users = Comm.find(params[:id])
    end

    def comm_params      
      params.require(:comms_users).permit(:comm_id, :user_id)
    end  
end
