# frozen_string_literal: true
# == Schema Information
#
# Table name: drivers
#
#  id              :integer          not null, primary key
#  name            :string           default(""), not null
#  password_digest :string           default(""), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Driver < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
end
