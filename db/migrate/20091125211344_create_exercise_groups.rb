class CreateExerciseGroups < ActiveRecord::Migration
  def self.up
    create_table :exercise_groups do |t|
      t.string :name
      t.string :classroom
      t.date :begins_at
      t.date :ends_at
      t.timestamps
    end
  end

  def self.down
    drop_table :exercise_groups
  end
end
