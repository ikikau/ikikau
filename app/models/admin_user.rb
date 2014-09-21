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

class AdminUser < ActiveRecord::Base

  #  Associations
  #-----------------------------------------------
  belongs_to :avatar,
    class_name: '::Medium',
    dependent: :destroy

  # WARNING:
  # `admin_account` is only storing security infromation like login password,
  # so an inverse association of it will end with creating vulnerabilities.
  def admin_account
    raise 'Forbidden association to `admin_account`'
  end


  #  Nested attributes
  #-----------------------------------------------
  accepts_nested_attributes_for :avatar,
    allow_destroy: true,
    reject_if: :all_blank


  #  Validations
  #-----------------------------------------------
  validates :name,
    presence: true,
    length: { maximum: 150 }

end
