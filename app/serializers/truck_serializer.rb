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

class TruckSerializer < ActiveModel::Serializer
  attributes :id, :identifier
end
