class AddHistoriaToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :historia, :text
  end

  def self.down
    remove_column :users, :historia
  end
end
