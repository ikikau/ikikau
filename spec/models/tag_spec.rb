# == Schema Information
#
# Table name: tags
#
#  id             :integer          not null, primary key
#  name           :string(255)      default(""), not null
#  taggings_count :integer          default(0), not null
#

require 'rails_helper'

RSpec.describe Tag, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
