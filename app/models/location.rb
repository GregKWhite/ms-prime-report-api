# frozen_string_literal: true
# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ApplicationRecord
  validates_presence_of :name

  has_many :driver_reports
end
