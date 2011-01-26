class CreateInfos < ActiveRecord::Migration
  def self.up
    create_table :infos do |t|
      t.datetime :data_cerimonia
      t.string :local_cerimonia
      t.datetime :data_festa
      t.string :local_festa

      t.timestamps
    end
  end

  def self.down
    drop_table :infos
  end
end
