class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :parameter_id
      t.integer :user_id
      t.integer :game_id
      t.integer :game_api_id
      t.string :send_param
      t.string :response

      t.timestamps null: false
    end
  end
end
