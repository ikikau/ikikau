class CreateEventDates < ActiveRecord::Migration
  def change
    create_table :event_dates do |t|
      t.belongs_to :event, index: true, null: false

      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.integer :weekday, limit: 1, null: false, index: true
      t.boolean :holiday, null: false
    end
  end
end
