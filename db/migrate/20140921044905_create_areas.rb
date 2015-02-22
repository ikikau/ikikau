class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :name, null: false, default: ''
      t.integer :events_count, null: false, default: 0
    end
  end
end
