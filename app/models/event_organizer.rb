# == Schema Information
#
# Table name: event_organizers
#
#  id           :integer          not null, primary key
#  event_id     :integer          not null, indexed
#  organizer_id :integer          not null, indexed
#

class EventOrganizer < ActiveRecord::Base

  #  Associations
  #-----------------------------------------------
  belongs_to :event
  belongs_to :organizer


  #  Validations
  #-----------------------------------------------
  validates_associated :event
  validates_associated :organizer

end
