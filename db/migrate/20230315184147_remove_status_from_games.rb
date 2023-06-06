class RemoveStatusFromGames < ActiveRecord::Migration[6.1]
  def change
    remove_column :games, :status, :string
  end
end
