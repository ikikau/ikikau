# == Schema Information
#
# Table name: event_dates
#
#  id       :integer          not null, primary key
#  event_id :integer          not null, indexed
#  start_at :datetime         not null
#  end_at   :datetime         not null
#  weekday  :boolean          not null, indexed
#  holiday  :boolean          not null, indexed
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_date do
  end
end
