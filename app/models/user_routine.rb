class UserRoutine < ApplicationRecord
  belongs_to :user
  has_many :task_routines, dependent: :destroy
  has_many :tasks, through: :task_routines

  validates_presence_of :title, :days_of_week

  accepts_nested_attributes_for :task_routines
end
