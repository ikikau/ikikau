class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.belongs_to :avatar

      t.string :name, null: false
      t.text :profile
      t.integer :role, limit: 1, null: false

      t.timestamps
    end
  end
end
