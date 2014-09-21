class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :name, null: false, default: ''
      t.integer :sort, null: false, default: 0
      t.integer :events_count, null: false, default: 0

      t.timestamps
    end
  end
end
