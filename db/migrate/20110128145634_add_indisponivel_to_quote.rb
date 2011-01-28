class AddIndisponivelToQuote < ActiveRecord::Migration
  def self.up
    add_column :quotes, :indisponivel, :boolean
  end

  def self.down
    remove_column :quotes, :indisponivel
  end
end
