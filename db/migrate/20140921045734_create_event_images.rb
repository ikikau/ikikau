class CreateEventImages < ActiveRecord::Migration
  def change
    create_table :event_images do |t|
      t.belongs_to :event, index: true, null: false
      t.belongs_to :medium, null: false

      t.string :title, null: false, default: ''
      t.text :description
      t.integer :sort, null: false, default: 0

      t.timestamps
    end
  end
end
