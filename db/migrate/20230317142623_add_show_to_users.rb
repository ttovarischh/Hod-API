class AddShowToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :show, :string, default: 'count'
  end
end
