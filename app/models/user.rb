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

class User < ActiveRecord::Base

  extend Enumerize
  include Concerns::EnumerizeExtension
  include Concerns::MediaUrlAccessor


  #  Associations
  #-----------------------------------------------
  belongs_to :avatar,
    class_name: '::Medium',
    dependent: :destroy
  has_many :event_organizers, dependent: :destroy


  #  Nested attributes
  #-----------------------------------------------
  accepts_nested_attributes_for :avatar,
    allow_destroy: true,
    reject_if: :all_blank


  #  Validations
  #-----------------------------------------------
  validates_associated :avatar
  validates :name,
    presence: true,
    length: { maximum: 100 }
  validates :role,
    presence: true,
    inclusion: { in: %w[participant organizer] }


  #  Scopes
  #-----------------------------------------------
  paginates_per 50


  #  Accessors
  #-----------------------------------------------
  enumerize :role,
    in: {
      participant: 1,
      organizer:   2,
    },
    default: :participant,
    scope: true

  attr_media_url :avatar,
    default_style: :thumbnail,
    default_url: '//placehold.it/240x170'

end
