# == Schema Information
#
# Table name: events
#
#  id                :integer          not null, primary key
#  area_id           :integer          not null, indexed
#  thumbnail_id      :integer          indexed
#  title             :string(255)      default(""), not null
#  content           :text
#  status            :integer          default(0), not null
#  prefecture        :integer          not null, indexed
#  address_1         :string(255)      default(""), not null
#  address_2         :string(255)      default(""), not null
#  address_code_1    :string(8)        default(""), not null, indexed => [address_code_2, address_code_3, address_code_4, address_code_5, address_code_6, address_code_7, address_code_8]
#  address_code_2    :string(8)        default(""), not null, indexed => [address_code_1, address_code_3, address_code_4, address_code_5, address_code_6, address_code_7, address_code_8]
#  address_code_3    :string(8)        default(""), not null, indexed => [address_code_1, address_code_2, address_code_4, address_code_5, address_code_6, address_code_7, address_code_8]
#  address_code_4    :string(8)        default(""), not null, indexed => [address_code_1, address_code_2, address_code_3, address_code_5, address_code_6, address_code_7, address_code_8]
#  address_code_5    :string(8)        default(""), not null, indexed => [address_code_1, address_code_2, address_code_3, address_code_4, address_code_6, address_code_7, address_code_8]
#  address_code_6    :string(8)        default(""), not null, indexed => [address_code_1, address_code_2, address_code_3, address_code_4, address_code_5, address_code_7, address_code_8]
#  address_code_7    :string(8)        default(""), not null, indexed => [address_code_1, address_code_2, address_code_3, address_code_4, address_code_5, address_code_6, address_code_8]
#  address_code_8    :string(8)        default(""), not null, indexed => [address_code_1, address_code_2, address_code_3, address_code_4, address_code_5, address_code_6, address_code_7]
#  address_code_size :integer          default(0), not null
#  created_at        :datetime
#  updated_at        :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
  end
end
