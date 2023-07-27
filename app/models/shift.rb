class Shift < ApplicationRecord
  belongs_to :user
  belongs_to :organisation

  def total_worked_hours
    if start_time.present? && end_time.present?
      total_hours = ((end_time - start_time) / 1.hour)
      total_hours - (break_length / 60.0)
    else
      0
    end
  end

  def total_pay
    total_worked_hours * organisation.hourly_rate
  end
end
