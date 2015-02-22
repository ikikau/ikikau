# == Schema Information
#
# Table name: areas
#
#  id           :integer          not null, primary key
#  name         :string(255)      default(""), not null
#  events_count :integer          default(0), not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :area do
  end
end
