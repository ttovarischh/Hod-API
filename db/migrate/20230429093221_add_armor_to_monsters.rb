class AddArmorToMonsters < ActiveRecord::Migration[6.1]
  def change
    add_column :monsters, :armor, :integer
  end
end
