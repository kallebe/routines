class CreateUserRoutines < ActiveRecord::Migration[7.0]
  def change
    create_table :user_routines do |t|
      t.string :title
      t.string :days_of_week
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
