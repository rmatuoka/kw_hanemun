class AddUserIdToPackage < ActiveRecord::Migration
  def self.up
    add_column :packages, :user_id, :integer
  end

  def self.down
    remove_column :packages, :user_id
  end
end
