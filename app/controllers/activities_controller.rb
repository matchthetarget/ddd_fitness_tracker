class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update destroy]

  def index
    @q = current_user.logs.ransack(params[:q])
    @logs = @q.result(distinct: true).includes(:user, :activity).order(started_at: :desc).page(params[:page]).per(15)
    @new_log = current_user.logs.build(
      started_at: Date.today
    )
  end

  def show
    @log = Log.new
  end

  def new
    @activity = Activity.new
  end

  def edit; end

  def create
    @activity = Activity.new(activity_params)

    if @activity.save
      redirect_to @activity, notice: "Activity was successfully created."
    else
      render :new
    end
  end

  def update
    if @activity.update(activity_params)
      redirect_to @activity, notice: "Activity was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @activity.destroy
    redirect_to activities_url, notice: "Activity was successfully destroyed."
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:name)
  end
end
