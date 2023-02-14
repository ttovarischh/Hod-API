class AddGameRefToMonsters < ActiveRecord::Migration[6.1]
  def change
    add_reference :monsters, :game, null: false, foreign_key: true
  end
end
