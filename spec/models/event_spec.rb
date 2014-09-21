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

require 'rails_helper'

RSpec.describe Event, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
