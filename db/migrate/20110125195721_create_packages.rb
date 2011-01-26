class CreatePackages < ActiveRecord::Migration
  def self.up
    create_table :packages do |t|
      t.string :nome
      t.timestamps
    end
  end

  def self.down
    drop_table :packages
  end
end
