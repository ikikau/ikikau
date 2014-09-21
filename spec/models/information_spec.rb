# == Schema Information
#
# Table name: information
#
#  id         :integer          not null, primary key
#  status     :integer          default(0), not null
#  title      :string(255)      default(""), not null
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Information, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
