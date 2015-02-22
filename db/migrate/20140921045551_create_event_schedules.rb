class CreateEventSchedules < ActiveRecord::Migration
  def change
    create_table :event_schedules do |t|
      t.belongs_to :event, index: true, null: false

      t.date :start_date, null: false
      t.date :end_date, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false

      t.boolean :weekday, null: false
      t.boolean :holiday, null: false
    end

    add_index :event_schedules, :weekday
    add_index :event_schedules, :holiday
  end
end
