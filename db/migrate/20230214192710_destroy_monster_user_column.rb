class DestroyMonsterUserColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :players, :monster
  end
end
