class AddFinalizadoToCart < ActiveRecord::Migration
  def self.up
    add_column :carts, :finalizado, :boolean
  end

  def self.down
    remove_column :carts, :finalizado
  end
end
