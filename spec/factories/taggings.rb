# == Schema Information
#
# Table name: taggings
#
#  id            :integer          not null, primary key
#  tag_id        :integer          not null, indexed
#  taggable_id   :integer          not null, indexed => [taggable_type]
#  taggable_type :string(255)      not null, indexed => [taggable_id]
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tagging do
  end
end
