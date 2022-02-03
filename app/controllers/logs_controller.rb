class LogsController < ApplicationController
  before_action :set_log, only: %i[show edit update destroy]

  def index
    @q = Log.ransack(params[:q])
    @logs = @q.result(distinct: true).includes(:user,
                                               :activity).page(params[:page]).per(10)
  end

  def show; end

  def new
    @log = Log.new
  end

  def edit; end

  def create
    @log = Log.new(log_params)

    if @log.save
      message = "Log was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @log, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @log.update(log_params)
      redirect_to @log, notice: "Log was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @log.destroy
    message = "Log was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to logs_url, notice: message
    end
  end

  private

  def set_log
    @log = Log.find(params[:id])
  end

  def log_params
    params.require(:log).permit(:activity_id, :user_id, :started_at,
                                :duration, :distance, :calories)
  end
end
