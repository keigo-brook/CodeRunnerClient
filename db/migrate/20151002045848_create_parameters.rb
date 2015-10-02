class CreateParameters < ActiveRecord::Migration
  def change
    create_table :parameters do |t|
      t.text :name
      t.text :param
      t.integer :game_api_id

      t.timestamps null: false
    end
  end
end
