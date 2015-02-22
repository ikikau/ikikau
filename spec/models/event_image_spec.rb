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

require 'rails_helper'

RSpec.describe EventImage, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
