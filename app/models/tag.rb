# == Schema Information
#
# Table name: tags
#
#  id             :integer          not null, primary key
#  name           :string(255)      default(""), not null
#  taggings_count :integer          default(0), not null
#

class Tag < ActiveRecord::Base

  #  Associations
  #-----------------------------------------------
  has_many :taggings, dependent: :destroy


  #  Validations
  #-----------------------------------------------
  validates :name,
    presence: true,
    length: { maximum: 100 }

end
