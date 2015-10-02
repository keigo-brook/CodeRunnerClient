class CreateGameApis < ActiveRecord::Migration
  def change
    create_table :game_apis do |t|
      t.integer :game_id
      t.text :end_point
      t.text :name

      t.timestamps null: false
    end
  end
end
