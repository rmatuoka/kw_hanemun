class CreatePresencas < ActiveRecord::Migration
  def self.up
    create_table :presencas do |t|
      t.string :convidado
      t.integer :adulto
      t.integer :crianca
      t.string :email
      t.string :telefone
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :presencas
  end
end
