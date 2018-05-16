class AddArchiveToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :archive, :boolean
  end
end
