class AddColorToLevel < ActiveRecord::Migration
  def change
    add_column :levels, :color, :string
  end
end
