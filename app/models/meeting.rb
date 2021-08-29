class Meeting < ApplicationRecord
  belongs_to :user
  validates :agent, :start_time, presence: true
  validate :past?, :available?

  private

  def past?
    errors.add(:start_time, "Start time can't be in the past") if start_time < DateTime.now
  end

  def available?
    agent_all_meetings = Meeting.where(agent: agent)
    agent_all_meetings.each do |other|
      unless other.start_time.to_datetime + (1.0 / 24.0) < start_time.to_datetime || other.start_time.to_datetime > start_time.to_datetime + (1.0 / 24.0)
        errors.add(:agent, "#{agent} is unavailable at this time")
      end
    end
  end
end
