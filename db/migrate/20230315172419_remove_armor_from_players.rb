class RemoveArmorFromPlayers < ActiveRecord::Migration[6.1]
  def change
    remove_column :players, :armor, :integer
  end
end
