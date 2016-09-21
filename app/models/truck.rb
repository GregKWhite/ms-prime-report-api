# frozen_string_literal: true
# == Schema Information
#
# Table name: trucks
#
#  id         :integer          not null, primary key
#  identifier :string           default(""), not null
#  mileage    :decimal(, )      default(0.0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Truck < ApplicationRecord
  validates :identifier, presence: true, uniqueness: true
  validates :mileage, presence: true, numericality: { greater_than_or_equal_to: 0 }

  after_create :create_weekly_report

  default_scope -> { order(:identifier) }

  def create_weekly_report
    WeeklyReport.create(
      truck: self,
      initial_mileage: mileage,
      current_mileage: mileage,
      total_gas: 0.0,
      total_paid: 0.0
    )
  end
end
