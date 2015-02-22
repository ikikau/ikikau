# == Schema Information
#
# Table name: events
#
#  id                :integer          not null, primary key
#  area_id           :integer          not null
#  thumbnail_id      :integer
#  title             :string(255)      default(""), not null
#  content           :text
#  status            :integer          default(0), not null
#  prefecture        :integer          not null
#  address_1         :string(255)      default(""), not null
#  address_2         :string(255)      default(""), not null
#  address_code_1    :string(8)        default(""), not null
#  address_code_2    :string(8)        default(""), not null
#  address_code_3    :string(8)        default(""), not null
#  address_code_4    :string(8)        default(""), not null
#  address_code_5    :string(8)        default(""), not null
#  address_code_6    :string(8)        default(""), not null
#  address_code_7    :string(8)        default(""), not null
#  address_code_8    :string(8)        default(""), not null
#  address_code_size :integer          default(0), not null
#  created_at        :datetime
#  updated_at        :datetime
#
# Indexes
#
#  events_address_codes        (address_code_1,address_code_2,address_code_3,address_code_4,address_code_5,address_code_6,address_code_7,address_code_8)
#  events_thumbnail_id_fk      (thumbnail_id)
#  index_events_on_area_id     (area_id)
#  index_events_on_prefecture  (prefecture)
#

require 'rails_helper'

RSpec.describe Event, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
