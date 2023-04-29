class AddConcToMonsters < ActiveRecord::Migration[6.1]
  def change
    add_column :monsters, :conc, :boolean, :default => false
  end
end
