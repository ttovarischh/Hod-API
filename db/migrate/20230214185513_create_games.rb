class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name
      t.string :code
      t.boolean :fight
      t.integer :turn

      t.timestamps
    end
  end
end
