# == Schema Information
#
# Table name: admin_user_accounts
#
#  id                     :integer          not null, primary key
#  admin_user_id          :integer          not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#
# Indexes
#
#  index_admin_user_accounts_on_admin_user_id         (admin_user_id)
#  index_admin_user_accounts_on_email                 (email) UNIQUE
#  index_admin_user_accounts_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe AdminUserAccount, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
