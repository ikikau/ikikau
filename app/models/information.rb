# == Schema Information
#
# Table name: information
#
#  id         :integer          not null, primary key
#  status     :integer          default(0), not null
#  title      :string(255)      default(""), not null
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Information < ActiveRecord::Base

  extend Enumerize
  include Concerns::EnumerizeExtension


  #  Validations
  #-----------------------------------------------
  validates :status,
    presence: true,
    inclusion: { in: %w[private public] }
  validates :title,
    presence: true,
    length: { maximum: 200 }
  validates :content,
    presence: true,
    length: { maximum: 3000 }


  #  Accessors
  #-----------------------------------------------
  enumerize :status,
    in: {
      private: 0,
      public:  1,
    },
    default: :private,
    scope: true


  #  Scopes
  #-----------------------------------------------
  paginates_per 20

end
