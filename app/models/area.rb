# == Schema Information
#
# Table name: areas
#
#  id           :integer          not null, primary key
#  name         :string(255)      default(""), not null
#  sort         :integer          default(0), not null
#  events_count :integer          default(0), not null
#  created_at   :datetime
#  updated_at   :datetime
#

class Area < ActiveRecord::Base

  #  Associations
  #-----------------------------------------------
  has_many :events, dependent: :destroy


  #  Validations
  #-----------------------------------------------
  validates :name,
    presence: true,
    length: { maximum: 150 }

end
