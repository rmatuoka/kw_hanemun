class AddUserIdToHair < ActiveRecord::Migration
  def self.up
    add_column :hairs, :user_id, :integer
  end

  def self.down
    remove_column :hairs, :user_id
  end
end
