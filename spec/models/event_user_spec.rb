# == Schema Information
#
# Table name: event_users
#
#  id       :integer          not null, primary key
#  event_id :integer          not null, indexed
#  user_id  :integer          not null, indexed
#

require 'rails_helper'

RSpec.describe EventUser, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
