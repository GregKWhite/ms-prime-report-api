# == Schema Information
#
# Table name: truck_logs
#
#  id           :integer          not null, primary key
#  truck_id     :integer
#  price        :decimal(, )
#  mileage      :decimal(, )
#  description  :text
#  performed_on :date
#

class TruckLog < ActiveRecord::Base
  belongs_to :truck

  validates_presence_of :price, :mileage, :truck, :performed_on

  default_scope -> { order(performed_on: :desc) }
end
