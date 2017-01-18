class NotesController < ApplicationController
  before_action :authenticate_user!, only:[:create,:edit,:update,:destroy]
  before_action :set_note, only:[:show, :edit, :update, :destroy]
  before_action :correct_user, only:[:edit, :update]
  
  def show
  end
  
  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      redirect_to @note, notice:"投稿が保存されました"
    else
      @notes = Note.all.order(created_at: :desc)
      render 'home/top'
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to @note, notice: "投稿が更新されました"
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    logger.debug "=================="
    logger.debug @note.id
    redirect_to root_path
  end
  
private
  def set_note
    @note = Note.find(params[:id])
  end
  
  def note_params
    params.require(:note).permit(:title, :content)
  end
  
  def correct_user
      note = Note.find(params[:id])
      if !current_user?(note.user)
        redirect_to root_path, alert: '許可されていないページです'
      end
  end
end
