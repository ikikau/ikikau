# == Schema Information
#
# Table name: events
#
#  id                :integer          not null, primary key
#  area_id           :integer          not null
#  thumbnail_id      :integer
#  title             :string(255)      default(""), not null
#  content           :text
#  status            :integer          default(0), not null
#  prefecture        :integer          not null
#  address_1         :string(255)      default(""), not null
#  address_2         :string(255)      default(""), not null
#  address_code_1    :string(8)        default(""), not null
#  address_code_2    :string(8)        default(""), not null
#  address_code_3    :string(8)        default(""), not null
#  address_code_4    :string(8)        default(""), not null
#  address_code_5    :string(8)        default(""), not null
#  address_code_6    :string(8)        default(""), not null
#  address_code_7    :string(8)        default(""), not null
#  address_code_8    :string(8)        default(""), not null
#  address_code_size :integer          default(0), not null
#  created_at        :datetime
#  updated_at        :datetime
#
# Indexes
#
#  events_address_codes        (address_code_1,address_code_2,address_code_3,address_code_4,address_code_5,address_code_6,address_code_7,address_code_8)
#  events_thumbnail_id_fk      (thumbnail_id)
#  index_events_on_area_id     (area_id)
#  index_events_on_prefecture  (prefecture)
#

class Event < ActiveRecord::Base

  extend Enumerize
  include Concerns::EnumerizeExtension
  include Concerns::MediaUrlAccessor
  include Concerns::Location


  #  Associations
  #-----------------------------------------------
  belongs_to :area
  belongs_to :thumbnail,
    class_name: '::Medium',
    dependent: :destroy
  has_many :event_schedules, dependent: :destroy
  has_many :event_organizers, dependent: :destroy
  has_many :organizers,
    through: :event_organizers,
    source: :organizer
  has_many :event_images, dependent: :destroy
  has_many :taggings, as: :taggable
  has_many :tags,
    through: :taggings,
    source: :tag


  #  Nested attributes
  #-----------------------------------------------
  accepts_nested_attributes_for :thumbnail,
    allow_destroy: true,
    reject_if: :all_blank

  accepts_nested_attributes_for :event_schedules,
    allow_destroy: true,
    reject_if: :all_blank

  accepts_nested_attributes_for :event_images,
    allow_destroy: true,
    reject_if: :all_blank

  accepts_nested_attributes_for :event_organizers,
    allow_destroy: true,
    reject_if: :all_blank


  #  Validations
  #-----------------------------------------------
  validates_associated :area, presence: true
  validates_associated :thumbnail
  # validates :event_organizers,
  #   presence: true,
  #   length: { minimum: 1 }
  validates :title,
    presence: true,
    length: { maximum: 250 }
  validates :content,
    presence: true,
    length: { maximum: 1500 }
  validates :status,
    presence: true,
    inclusion: { in: %w[private public] }


  #  Scope
  #-----------------------------------------------
  paginates_per 10

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
