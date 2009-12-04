class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :first_name
      t.string :surname
      t.string :student_number
      t.string :email
      t.string :account_type, :default => "User"

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
