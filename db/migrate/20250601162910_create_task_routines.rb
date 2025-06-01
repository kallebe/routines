class CreateTaskRoutines < ActiveRecord::Migration[7.0]
  def change
    create_table :task_routines do |t|
      t.time :start
      t.time :end
      t.references :user_routine, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
