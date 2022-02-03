class Api::V1::ActivitiesController < Api::V1::GraphitiController
  def index
    activities = ActivityResource.all(params)
    respond_with(activities)
  end

  def show
    activity = ActivityResource.find(params)
    respond_with(activity)
  end

  def create
    activity = ActivityResource.build(params)

    if activity.save
      render jsonapi: activity, status: :created
    else
      render jsonapi_errors: activity
    end
  end

  def update
    activity = ActivityResource.find(params)

    if activity.update_attributes
      render jsonapi: activity
    else
      render jsonapi_errors: activity
    end
  end

  def destroy
    activity = ActivityResource.find(params)

    if activity.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: activity
    end
  end
end
