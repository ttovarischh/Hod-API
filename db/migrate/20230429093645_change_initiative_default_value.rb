class ChangeInitiativeDefaultValue < ActiveRecord::Migration[6.1]
  def change
    change_column :players, :initiative, :integer, :default => 0
  end
end
