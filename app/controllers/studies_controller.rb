class StudiesController < ApplicationController
  def index
    @studies = Study.all.sum(:time)
  end
  
  def show
    @study = Study.find(params[:member_id])
    @studies = Study.all.sum(:time)
  end
  
  def new
    @study = Study.new
  end
  
  def edit
  end
  
  def create
    @study = Study.new(study_params)
    @study.author = current_member
    if @study.save
      redirect_to action: 'index', notice: "勉強時間が入力出来ました。"
    else
      render "new"
    end
  end
  
  def update
  end

  def destroy
  end

  private def study_params
    params.require(:study).permit(:time, :date)
  end
end