# == Schema Information
#
# Table name: taggings
#
#  id            :integer          not null, primary key
#  tag_id        :integer          not null, indexed
#  taggable_id   :integer          not null, indexed => [taggable_type]
#  taggable_type :string(255)      not null, indexed => [taggable_id]
#

require 'rails_helper'

RSpec.describe Tagging, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
