class AddUserRefToGames < ActiveRecord::Migration[6.1]
  def change
    add_reference :games, :user, foreign_key: true
  end
end
