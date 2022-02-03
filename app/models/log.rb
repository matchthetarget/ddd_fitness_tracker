class Log < ApplicationRecord
  # Direct associations

  belongs_to :activity

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    activity.to_s
  end
end
