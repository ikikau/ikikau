# == Schema Information
#
# Table name: admin_users
#
#  id         :integer          not null, primary key
#  avatar_id  :integer
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe AdminUser, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
