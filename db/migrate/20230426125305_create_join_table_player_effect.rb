class CreateJoinTablePlayerEffect < ActiveRecord::Migration[6.1]
  def change
    create_join_table :players, :effects do |t|
      t.index [:player_id, :effect_id]
      t.index [:effect_id, :player_id]
    end
  end
end
