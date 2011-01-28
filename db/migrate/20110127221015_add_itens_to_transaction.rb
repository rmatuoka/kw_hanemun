class AddItensToTransaction < ActiveRecord::Migration
  def self.up
    add_column :transactions, :session_id, :text
    add_column :transactions, :email, :string
  end

  def self.down
    remove_column :transactions, :email
    remove_column :transactions, :session_id
  end
end
