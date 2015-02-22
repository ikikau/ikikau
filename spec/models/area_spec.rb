# == Schema Information
#
# Table name: areas
#
#  id           :integer          not null, primary key
#  name         :string(255)      default(""), not null
#  events_count :integer          default(0), not null
#

require 'rails_helper'

RSpec.describe Area, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
