class RemoveHpFromPlayers < ActiveRecord::Migration[6.1]
  def change
    remove_column :players, :hp, :integer
  end
end
