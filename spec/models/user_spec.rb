# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  avatar_id  :integer
#  name       :string(255)      not null
#  profile    :text
#  role       :integer          not null
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  users_avatar_id_fk  (avatar_id)
#

require 'rails_helper'

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
