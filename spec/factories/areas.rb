# == Schema Information
#
# Table name: areas
#
#  id           :integer          not null, primary key
#  name         :string(255)      default(""), not null
#  sort         :integer          default(0), not null
#  events_count :integer          default(0), not null
#  created_at   :datetime
#  updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :area do
  end
end
