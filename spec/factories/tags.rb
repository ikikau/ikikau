# == Schema Information
#
# Table name: tags
#
#  id             :integer          not null, primary key
#  name           :string(255)      default(""), not null
#  taggings_count :integer          default(0), not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag do
    sequence(:name) { |n| 'タグ %d' % n }
  end
end
