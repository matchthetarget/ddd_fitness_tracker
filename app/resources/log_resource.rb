class LogResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :activity_id, :integer
  attribute :user_id, :integer
  attribute :started_at, :datetime
  attribute :duration, :integer
  attribute :distance, :integer
  attribute :calories, :integer

  # Direct associations

  belongs_to :activity

  belongs_to :user

  # Indirect associations
end
