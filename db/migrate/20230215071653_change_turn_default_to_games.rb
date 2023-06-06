class ChangeTurnDefaultToGames < ActiveRecord::Migration[6.1]
  def change
    change_column :games, :turn, :integer, :default => 0
  end
end
