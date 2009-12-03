class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
        t.integet :user_id
        t.integer :exercise_group_id

      t.timestamps
    end
  end

  def self.down
    drop_table :registrations
  end
end
