class AddUserIdToFoto < ActiveRecord::Migration
  def self.up
    add_column :fotos, :user_id, :integer
  end

  def self.down
    remove_column :fotos, :user_id
  end
end
