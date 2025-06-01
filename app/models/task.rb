class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :task_routines, dependent: :destroy
  has_many :user_routines, through: :task_routines
end
