# frozen_string_literal: true
# == Schema Information
#
# Table name: weekly_reports
#
#  id              :integer          not null, primary key
#  truck_id        :integer
#  initial_mileage :decimal(, )      default(0.0), not null
#  current_mileage :decimal(, )      default(0.0), not null
#  total_gas       :decimal(, )      default(0.0), not null
#  total_paid      :decimal(, )      default(0.0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class WeeklyReport < ApplicationRecord
  validates_numericality_of :initial_mileage, :current_mileage, :total_paid, :total_gas,
                            greater_than_or_equal_to: 0
  belongs_to :truck

  default_scope -> { order(created_at: :desc) }
  scope :current, -> { where(created_at: DateRange.current_week).order(:truck_id) }
  scope :within_range, ->(date_range) { where(created_at: date_range) }

  def miles_driven
    current_mileage - initial_mileage
  end

  def self.create_weekly_reports!
    Truck.find_each do |truck|
      create(
        truck: truck,
        initial_mileage: truck.mileage,
        current_mileage: truck.mileage,
        total_gas: 0.0,
        total_paid: 0.0
      )
    end
  end
end
