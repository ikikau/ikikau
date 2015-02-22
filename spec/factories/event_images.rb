# == Schema Information
#
# Table name: event_images
#
#  id          :integer          not null, primary key
#  event_id    :integer          not null
#  image_id    :integer          not null
#  title       :string(255)      default(""), not null
#  description :text
#  sort        :integer          default(0), not null
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  event_images_image_id_fk        (image_id)
#  index_event_images_on_event_id  (event_id)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_image do
  end
end
