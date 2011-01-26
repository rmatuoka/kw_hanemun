class AddUserIdToHotel < ActiveRecord::Migration
  def self.up
    add_column :hotels, :user_id, :integer
  end

  def self.down
    remove_column :hotels, :user_id
  end
end
