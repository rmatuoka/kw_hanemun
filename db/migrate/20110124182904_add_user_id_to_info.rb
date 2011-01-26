class AddUserIdToInfo < ActiveRecord::Migration
  def self.up
    add_column :infos, :user_id, :integer
  end

  def self.down
    remove_column :infos, :user_id
  end
end
