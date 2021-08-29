class Meeting < ApplicationRecord
  belongs_to :user
  validates :agent, :start_time, presence: { message: 'Field cannot be blank' }
  validate :past?, :available?

  private

  def past?
    errors.add(:start_time, "Start time can't be in the past") if start_time.present? && start_time < DateTime.now
  end

  def available?
    return unless start_time.present? && agent.present?

    agent_all_meetings = Meeting.where(agent: agent)
    h = (1.0 / 24.0)
    agent_all_meetings.each do |other|
      unless other.start_time.to_datetime + h < start_time.to_datetime || other.start_time.to_datetime > start_time.to_datetime + h
        errors.add(:agent, "#{agent} is unavailable at this time")
      end
    end
  end
end
