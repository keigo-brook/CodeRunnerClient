class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :base_url
      t.text :name

      t.timestamps null: false
    end
  end
end
