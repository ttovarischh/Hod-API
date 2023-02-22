class AddImageToEffect < ActiveRecord::Migration[6.1]
  def change
    add_column :effects, :image, :string
  end
end
