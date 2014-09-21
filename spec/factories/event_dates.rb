# == Schema Information
#
# Table name: event_dates
#
#  id       :integer          not null, primary key
#  event_id :integer          not null, indexed
#  start_at :datetime         not null
#  end_at   :datetime         not null
#  weekday  :integer          not null
#  holiday  :boolean          not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_date do
  end
end
