# == Schema Information
#
# Table name: event_organizers
#
#  id           :integer          not null, primary key
#  event_id     :integer          not null
#  organizer_id :integer          not null
#
# Indexes
#
#  event_organizers_event_id_fk      (event_id)
#  event_organizers_organizer_id_fk  (organizer_id)
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
