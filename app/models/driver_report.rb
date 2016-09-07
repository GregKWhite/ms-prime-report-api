# frozen_string_literal: true
# == Schema Information
#
# Table name: driver_reports
#
#  id          :integer          not null, primary key
#  driver_id   :integer
#  location_id :integer
#  helper_id   :integer
#  gallons     :decimal(, )      default(0.0), not null
#  amount_paid :decimal(, )      default(0.0), not null
#  mileage     :decimal(, )      default(0.0), not null
#  notes       :text             default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  truck_id    :integer
#

class DriverReport < ApplicationRecord
  validates_presence_of :gallons, :amount_paid, :mileage
  validates_numericality_of :amount_paid, :gallons, :mileage, greater_than_or_equal_to: 0

  belongs_to :driver
  belongs_to :helper, class_name: 'Driver', required: false
  belongs_to :location
  belongs_to :truck

  default_scope -> { order(created_at: :desc) }

  scope :within_range, ->(date_range) { where(created_at: date_range) }
end
