class CreateJoinTablePlayerMonster < ActiveRecord::Migration[6.1]
  def change
    create_join_table :monsters, :effects do |t|
      t.index [:monster_id, :effect_id]
      t.index [:effect_id, :monster_id]
    end
  end
end
