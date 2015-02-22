# == Schema Information
#
# Table name: event_images
#
#  id          :integer          not null, primary key
#  event_id    :integer          not null
#  image_id    :integer          not null
#  title       :string(255)      default(""), not null
#  description :text
#  sort        :integer          default(0), not null
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  event_images_image_id_fk        (image_id)
#  index_event_images_on_event_id  (event_id)
#

class EventImage < ActiveRecord::Base

  extend Enumerize
  include Concerns::EnumerizeExtension


  #  Associations
  #-----------------------------------------------
  belongs_to :event
  belongs_to :image, class: 'Medium'


  #  Nested attributes
  #-----------------------------------------------
  accepts_nested_attributes_for :image,
    allow_destroy: true,
    reject_if: :all_blank


  #  Validations
  #-----------------------------------------------
  validates_associated :event, presence: true
  validates_associated :image, presence: true
  validates :title,
    presence: true,
    length: { maximum: 200 }
  validates :description,
    presence: true,
    length: { maximum: 1000 }


  #  Accessors
  #-----------------------------------------------
  attr_media_url :image,
    default_style: :thumbnail,
    default_url: '//placehold.it/240x170'

end
