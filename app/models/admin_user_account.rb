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

class AdminUserAccount < ActiveRecord::Base

  #  Associations
  #-----------------------------------------------
  belongs_to :admin_user, dependent: :destroy


  #  Nested attributes
  #-----------------------------------------------
  accepts_nested_attributes_for :admin_user


  #  Validations
  #-----------------------------------------------
  validates_associated :admin_user, presence: true
  validates :email, presence: true, email: true


  #  Device
  #-----------------------------------------------
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable

end
