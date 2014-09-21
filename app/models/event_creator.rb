# == Schema Information
#
# Table name: event_creators
#
#  id       :integer          not null, primary key
#  event_id :integer          not null, indexed
#  user_id  :integer          not null, indexed
#

class EventCreator < ActiveRecord::Base

  #  Associations
  #-----------------------------------------------
  belongs_to :event
  belongs_to :user


  #  Validations
  #-----------------------------------------------
  validates_associated :event
  validates_associated :user

end
