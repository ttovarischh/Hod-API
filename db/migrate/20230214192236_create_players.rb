class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.boolean :monster, :default => false
      t.integer :initiative
      t.integer :hp
      t.string :language
      t.integer :perc
      t.integer :inv
      t.integer :ins
      t.integer :armor
      t.boolean :conc

      t.timestamps
    end
  end
end
