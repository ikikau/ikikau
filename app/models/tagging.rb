# == Schema Information
#
# Table name: taggings
#
#  id            :integer          not null, primary key
#  tag_id        :integer          not null, indexed
#  taggable_id   :integer          not null, indexed => [taggable_type]
#  taggable_type :string(255)      not null, indexed => [taggable_id]
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
