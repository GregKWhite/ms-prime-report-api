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
end
