class AddActiveToMonsters < ActiveRecord::Migration[6.1]
  def change
    add_column :monsters, :active, :boolean, :default => false
  end
end
