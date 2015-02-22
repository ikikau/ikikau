# == Schema Information
#
# Table name: event_images
#
#  id          :integer          not null, primary key
#  event_id    :integer          not null, indexed
#  image_id    :integer          not null, indexed
#  title       :string(255)      default(""), not null
#  description :text
#  sort        :integer          default(0), not null
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_image do
  end
end
