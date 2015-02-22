# == Schema Information
#
# Table name: event_schedules
#
#  id         :integer          not null, primary key
#  event_id   :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  start_time :time             not null
#  end_time   :time             not null
#  weekday    :boolean          not null
#  holiday    :boolean          not null
#
# Indexes
#
#  index_event_schedules_on_event_id  (event_id)
#  index_event_schedules_on_holiday   (holiday)
#  index_event_schedules_on_weekday   (weekday)
#

class EventSchedule < ActiveRecord::Base

  #  Associations
  #-----------------------------------------------
  belongs_to :event


  #  Validations
  #-----------------------------------------------
  validates_associated :event, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  validate do |schedule|
    unless Date.today <= schedule.start_date && schedule.start_date < schedule.end_date
      schedule.errors.add :start_date, '正しい期間を指定して下さい'
    end
  end

  validate do |schedule|
    unless schedule.start_time < schedule.end_time
      schedule.errors.add :start_time, '正しい期間を指定して下さい'
    end
  end


  #  Scopes
  #-----------------------------------------------
  scope :holiday, -> { where(holiday: true).group(:event_id) }
  scope :weekday, -> { where(weekday: true).group(:event_id) }


  #  Callbacks
  #-----------------------------------------------
  before_validation do |date|
    return unless self.start_date.present? && self.end_date.present?

    # 期間が平日・休日を含んでいるか
    wday = self.start_date.wday
    duration = self.end_date - self.start_date
    self.weekday = (wday < 6)
    self.holiday = (wday + duration >= 6)
  end

end
