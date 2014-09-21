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

require 'rails_helper'

RSpec.describe Area, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
