class CreateQuotes < ActiveRecord::Migration
  def self.up
    create_table :quotes do |t|
      t.integer :package_id
      t.string :nome
      t.string :descricao
      t.decimal :valor
      t.timestamps
    end
  end

  def self.down
    drop_table :quotes
  end
end
