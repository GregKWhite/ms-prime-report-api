require "administrate/field/base"

class TextField < Administrate::Field::Base
  def to_s
    data
  end

  def presence
    data.present? ? 'Yes' : 'No'
  end
end
