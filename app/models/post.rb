# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  thumbnail_id :integer
#  kind         :integer          default(0), not null
#  status       :integer          default(0), not null
#  title        :string(255)      default(""), not null
#  content      :text
#  created_at   :datetime
#  updated_at   :datetime
#

class Post < ActiveRecord::Base

  extend Enumerize
  include Concerns::EnumerizeExtension


  #  Validations
  #-----------------------------------------------
  validates :status,
    presence: true,
    inclusion: { in: %w[private public] }
  validates :kind,
    presence: true,
    inclusion: { in: %w[information feature] }
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

  enumerize :kind,
    in: {
      information: 0,
      feature:     1,
    },
    default: :information,
    scope: true


  #  Scopes
  #-----------------------------------------------
  paginates_per 20

end
