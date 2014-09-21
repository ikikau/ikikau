class CreateEventDates < ActiveRecord::Migration
  def change
    create_table :event_dates do |t|
      t.belongs_to :event, index: true, null: false

      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.boolean :weekday, null: false
      t.boolean :holiday, null: false
    end

    add_index :event_dates, :weekday
    add_index :event_dates, :holiday
  end
end
