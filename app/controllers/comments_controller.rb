class CommentsController < ApplicationController
  before_action :authenticate_user!
  after_action :create_notifications, only: [:create]

  def new
    @comment = Comment.new
  end

  def create
    if user_signed_in?
      @comment = current_user.comments.new(comment_params)
    end

    if @comment.save
      redirect_to lesson_path(params[:comment][:lesson_id]), notice: 'コメント成功しました'
    else
      flash.now[:alert] = '失敗しました'
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @lesson = @comment.lesson
    @comment.destroy
    redirect_to lesson_path(@lesson),notice: 'コメント削除しました'
  end

  private

  def comment_params
    params.require(:comment).permit(:lesson_id, :body,:user_id)
  end

  def create_notifications
    if params[:comment][:user_id].blank?
      @user = Lesson.find(params[:comment][:lesson_id]).user
    else
      @user = User.find(params[:comment][:user_id])
    end
   # return if @lesson.id == current_user.id

    Notification.create(
      user_id: @user.id,
      notified_by_id: current_user.id,
      lesson_id: params[:comment][:lesson_id],
      notified_type: 'コメント'
    )
  end
end
