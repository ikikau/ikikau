# == Schema Information
#
# Table name: event_dates
#
#  id       :integer          not null, primary key
#  event_id :integer          not null, indexed
#  start_at :datetime         not null
#  end_at   :datetime         not null
#  weekday  :integer          not null
#  holiday  :boolean          not null
#

require 'rails_helper'

RSpec.describe EventDate, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
