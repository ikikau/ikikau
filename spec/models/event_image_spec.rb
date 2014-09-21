# == Schema Information
#
# Table name: event_images
#
#  id          :integer          not null, primary key
#  event_id    :integer          not null, indexed
#  medium_id   :integer          not null, indexed
#  title       :string(255)      default(""), not null
#  description :text
#  sort        :integer          default(0), not null
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe EventImage, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
