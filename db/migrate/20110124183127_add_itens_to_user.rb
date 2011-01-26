class AddItensToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :nome_noivo, :string
    add_column :users, :nome_noiva, :string
  end

  def self.down
    remove_column :users, :nome_noiva
    remove_column :users, :nome_noivo
  end
end
