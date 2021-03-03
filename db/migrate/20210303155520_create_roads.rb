class CreateRoads < ActiveRecord::Migration[6.0]
  def change
    create_table :roads do |t|
      t.integer :distance
      t.integer :city_start_id, foreign_key: true
      t.integer :city_end_id, foreign_key: true

      t.timestamps
    end
  end
end
