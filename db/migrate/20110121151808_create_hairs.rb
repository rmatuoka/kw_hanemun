class CreateHairs < ActiveRecord::Migration
  def self.up
    create_table :hairs do |t|
      t.string :nome
      t.string :telefone
      t.string :site

      t.timestamps
    end
  end

  def self.down
    drop_table :hairs
  end
end
