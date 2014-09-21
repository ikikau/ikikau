# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  area_id       :integer          not null, indexed
#  thumbnail_id  :integer          indexed
#  title         :string(255)      default(""), not null
#  content       :text
#  status        :integer          default(0), not null
#  location_name :string(255)      default(""), not null
#  prefecture    :integer          not null
#  postal_code   :string(7)
#  address       :string(255)      default(""), not null
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
  end
end
