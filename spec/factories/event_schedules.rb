# == Schema Information
#
# Table name: event_schedules
#
#  id         :integer          not null, primary key
#  event_id   :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  start_time :time             not null
#  end_time   :time             not null
#  weekday    :boolean          not null
#  holiday    :boolean          not null
#
# Indexes
#
#  index_event_schedules_on_event_id  (event_id)
#  index_event_schedules_on_holiday   (holiday)
#  index_event_schedules_on_weekday   (weekday)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_schedule do
    start_date { Date.today }
    end_date   { Date.today + 10.months }
    start_time { Time.now }
    end_time   { Time.now + 3.hours }
  end
end
