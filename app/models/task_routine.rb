class TaskRoutine < ApplicationRecord
  belongs_to :user_routine
  belongs_to :task
end
