class Api::V1::LogsController < Api::V1::GraphitiController
  def index
    logs = LogResource.all(params)
    respond_with(logs)
  end

  def show
    log = LogResource.find(params)
    respond_with(log)
  end

  def create
    log = LogResource.build(params)

    if log.save
      render jsonapi: log, status: :created
    else
      render jsonapi_errors: log
    end
  end

  def update
    log = LogResource.find(params)

    if log.update_attributes
      render jsonapi: log
    else
      render jsonapi_errors: log
    end
  end

  def destroy
    log = LogResource.find(params)

    if log.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: log
    end
  end
end
