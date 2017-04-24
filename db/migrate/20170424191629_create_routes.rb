class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name
      t.integer :grade_id
      t.integer :level_id
      t.integer :posx
      t.integer :posy
      t.integer :score

      t.timestamps null: false
    end
  end
end
