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

class Feature < Post

  #  Scopes
  #-----------------------------------------------
  default_scope -> { with_kind :feature }


  #  Callbacks
  #-----------------------------------------------
  after_initialize do |feature|
    feature.kind = :feature
  end

end
