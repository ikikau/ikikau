# == Schema Information
#
# Table name: taggings
#
#  id            :integer          not null, primary key
#  tag_id        :integer          not null
#  taggable_id   :integer          not null
#  taggable_type :string(255)      not null
#
# Indexes
#
#  index_taggings_on_tag_id                         (tag_id)
#  index_taggings_on_taggable_id_and_taggable_type  (taggable_id,taggable_type)
#

require 'rails_helper'

RSpec.describe Tagging, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
