class CreateExerciseGroups < ActiveRecord::Migration
  def self.up
    create_table :exercise_groups do |t|
      t.string :name
      t.string :classroom
      t.time :begins_at
      t.time :ends_at
      t.integer :course_instance_id
      t.integer :max_registrations, :default=>20
      t.timestamps
    end
  end

  def self.down
    drop_table :exercise_groups
  end
end
