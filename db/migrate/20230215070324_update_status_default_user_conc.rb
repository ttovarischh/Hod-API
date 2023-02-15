class UpdateStatusDefaultUserConc < ActiveRecord::Migration[6.1]
  def change
    change_column :players, :conc, :boolean, :default => false
  end
end
