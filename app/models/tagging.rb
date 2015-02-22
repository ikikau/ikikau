# == Schema Information
#
# Table name: taggings
#
#  id            :integer          not null, primary key
#  tag_id        :integer          not null
#  taggable_id   :integer          not null
#  taggable_type :string(255)      not null
#
# Indexes
#
#  index_taggings_on_tag_id                         (tag_id)
#  index_taggings_on_taggable_id_and_taggable_type  (taggable_id,taggable_type)
#

class Tagging < ActiveRecord::Base

  #  Associations
  #-----------------------------------------------
  belongs_to :tag
  belongs_to :taggable, polymorphic: true


  #  Validations
  #-----------------------------------------------
  validates_associated :tag
  validates_associated :taggable

end
