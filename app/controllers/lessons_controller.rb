class LessonsController < ApplicationController


  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = current_user.lessons.new(lesson_params)
    if @lesson.save
      redirect_to lessons_path, notice: 'レッスンの作成に成功しました'
    else
      flash.now[:alert] = "レッスンの作成に失敗しました"
      render :new
    end
  end

  def index
  if params[:q].nil?
    @lessons = Lesson.all
  else
    @lessons = Lesson.search_by_keyword(params[:q])
  end
end


  def show
    @lesson = Lesson.find(params[:id])
    @comments = Comment.all
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to lessons_path
    else
      render 'edit'
    end
  end

  def destroy

    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to lessons_path
  end

  private

  def lesson_params
    params.require(:lesson).permit(:image, :title, :description, :price, :headcount)
  end
end
