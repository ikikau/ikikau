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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :information do
    sequence(:title) { |n| 'お知らせ %d' % n }
    status :public
    content '内容' * 20
  end
end
