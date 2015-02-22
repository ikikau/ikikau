# == Schema Information
#
# Table name: event_organizers
#
#  id           :integer          not null, primary key
#  event_id     :integer          not null
#  organizer_id :integer          not null
#
# Indexes
#
#  event_organizers_event_id_fk      (event_id)
#  event_organizers_organizer_id_fk  (organizer_id)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_organizer do
  end
end
