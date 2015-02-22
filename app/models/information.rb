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

  #  Scopes
  #-----------------------------------------------
  default_scope -> { with_kind :information }


  #  Callbacks
  #-----------------------------------------------
  after_initialize do |information|
    information.kind = :information
  end

end
