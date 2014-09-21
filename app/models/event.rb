# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  area_id       :integer          not null, indexed
#  thumbnail_id  :integer          indexed
#  title         :string(255)      default(""), not null
#  content       :text
#  status        :integer          default(0), not null
#  location_name :string(255)      default(""), not null
#  prefecture    :integer          not null
#  postal_code   :string(7)
#  address       :string(255)      default(""), not null
#  created_at    :datetime
#  updated_at    :datetime
#

class Event < ActiveRecord::Base

  extend Enumerize
  include Concerns::EnumerizeExtension
  include Concerns::MediaUrlAccessor


  #  Associations
  #-----------------------------------------------
  belongs_to :area
  belongs_to :thumbnail,
    class_name: '::Medium',
    dependent: :destroy
  has_many :event_dates, dependent: :destroy
  has_many :event_users, dependent: :destroy
  has_many :event_images, dependent: :destroy
  has_many :taggings, as: :taggable
  has_many :tags,
    through: :taggings,
    source: :tag


  #  Nested attributes
  #-----------------------------------------------
  accepts_nested_attributes_for :thumbnail,
    allow_destroy: true

  accepts_nested_attributes_for :event_dates,
    allow_destroy: true,
    reject_if: ->(attr) { attr.except('id').values.any?(&:blank?) }


  #  Validations
  #-----------------------------------------------
  validates_associated :area, presence: true
  validates_associated :thumbnail
  validates :title,
    presence: true,
    length: { maximum: 250 }
  validates :content,
    presence: true,
    length: { maximum: 1500 }
  validates :status,
    presence: true,
    inclusion: { in: %w[private public] }
  validates :location_name,
    presence: true,
    length: { maximum: 150 }
  validates :prefecture,
    presence: true,
    inclusion: { in: 1..47 }
  validates :postal_code, postal_code: true
  validates :address, presence: true


  #  Scope
  #-----------------------------------------------
  paginates_per 10

  scope :public, -> { with_status :public }

  scope :holiday, -> { joins(:event_dates).merge(EventDate.holiday) }
  scope :weekday, -> { joins(:event_dates).merge(EventDate.weekday) }


  #  Accessors
  #-----------------------------------------------
  enumerize :status,
    in: {
      private: 0,
      public:  1,
    },
    default: :private,
    scope: true

  attr_media_url :thumbnail,
    default_style: :thumbnail,
    default_url: '//placehold.it/240x170'

end
