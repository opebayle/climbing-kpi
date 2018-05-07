class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.integer :route_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
