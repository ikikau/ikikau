# == Schema Information
#
# Table name: event_dates
#
#  id       :integer          not null, primary key
#  event_id :integer          not null, indexed
#  start_at :datetime         not null
#  end_at   :datetime         not null
#  weekday  :integer          not null
#  holiday  :boolean          not null
#

class EventDate < ActiveRecord::Base

  #  Associations
  #-----------------------------------------------
  belongs_to :event


  #  Validations
  #-----------------------------------------------
  validates_associated :event, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true

  validate do |date|
    unless Date.today < self.start_at && self.start_at < self.end_at
      self.errors.add :start_at, '正しい期間を指定して下さい'
    end
  end


  #  Scopes
  #-----------------------------------------------
  scope :holiday, -> { where(holiday: true).group(:event_id) }
  scope :weekday, -> { where(weekday: true).group(:event_id) }


  #  Callbacks
  #-----------------------------------------------
  before_validation do |date|
    return unless self.start_at.present? && self.end_at.present?

    # 期間が平日・休日を含んでいるか
    wday = self.start_at.wday
    duration = ((self.end_at.to_f - self.start_at.to_f) / 1.day).floor
    self.weekday = (wday < 6)
    self.holiday = (wday + duration >= 6)
  end

end
