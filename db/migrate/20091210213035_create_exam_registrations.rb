class CreateExamRegistrations < ActiveRecord::Migration
  def self.up
    create_table :exam_registrations do |t|
      t.integer :user_id
      t.integer :exam_id
      t.timestamps
    end
  end

  def self.down
    drop_table :exam_registrations
  end
end
