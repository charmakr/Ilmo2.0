class CreateExams < ActiveRecord::Migration
  def self.up
    create_table :exams do |t|
      t.string  :name
      t.time    :start_time
      t.time    :end_time
      t.integer :course_id
      t.timestamps
    end
  end

  def self.down
    drop_table :exams
  end
end
