class AddInitiativeStateToGames < ActiveRecord::Migration[6.1]
  def change
    change_column :games, :fight, :boolean, :default => false
  end
end
