json.extract! log, :id, :activity_id, :user_id, :started_at, :duration,
              :distance, :calories, :created_at, :updated_at
json.url log_url(log, format: :json)
