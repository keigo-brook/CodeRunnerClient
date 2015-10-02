class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name
      t.text :profile_text
      t.text :token

      t.timestamps null: false
    end
  end
end
