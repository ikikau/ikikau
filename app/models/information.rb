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

class Information < Post

  extend Enumerize
  include Concerns::EnumerizeExtension


  #  Scopes
  #-----------------------------------------------
  default_scope -> { with_kind :information }

end
