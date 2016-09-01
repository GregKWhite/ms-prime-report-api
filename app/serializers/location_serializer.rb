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

class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name
end
