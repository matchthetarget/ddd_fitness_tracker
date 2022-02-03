class Activity < ApplicationRecord
  # Direct associations

  has_many   :logs,
             dependent: :destroy

  # Indirect associations

  # Validations

  validates :name, uniqueness: true

  validates :name, presence: true

  # Scopes

  def to_s
    name
  end
end
