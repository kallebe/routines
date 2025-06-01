class UserRoutine < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :days_of_week
end
