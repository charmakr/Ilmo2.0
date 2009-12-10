class CreateNewsfeedLikes < ActiveRecord::Migration
  def self.up
    create_table :newsfeed_likes do |t|
      t.integer :user_id
      t.integer :newsfeed_id
      t.timestamps
    end
  end

  def self.down
    drop_table :newsfeed_likes
  end
end
