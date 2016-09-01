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

class DriverReportSerializer < ActiveModel::Serializer
  attributes :id, :driver_id, :location_id, :helper_id, :gallons, :amount_paid, :mileage,
             :notes, :truck_id
end
