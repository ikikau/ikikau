# == Schema Information
#
# Table name: event_users
#
#  id       :integer          not null, primary key
#  event_id :integer          not null, indexed
#  user_id  :integer          not null, indexed
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_user do
  end
end
